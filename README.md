# matlab graph routines
Some common functionalities for working with graphs in Matlab
- **random_multi_bottleneck_graph.m** creates the adjacency matrix of a graph that has groups of vertices of sizes N(i) that are connected to each other with some given probablities P(i,j). You can also create weighted or signed graphs.
	
	##### Examples 
    1. One bottleneck
    ```matlab
	N = [15,25];
	P = [.90,.10; 
		 .10,.85];
	A = random_multi_bottleneck_graph(N,P); 
	spy(A)
	```
	![N = [15,25]; 
	P = [.90,.10; 
		 .10,.85];](/images/random_multi_bottleneck_simple_graph_ex1.png)
	
	2. Three bottlenecks
	```matlab
	N = [20,15,25];
	P = [.90,.10,.10; 
		 .10,.85,.20; 
		 .10,.20,.90];
	A = random_multi_bottleneck_graph(N,P); 
	spy(A)
	```
	![N = [20,15,25];
	P = [.90,.10,.10; 
		 .10,.85,.20; 
		 .10,.20,.90];](/images/random_multi_bottleneck_simple_graph_ex2.png)

	3. Complete connected components
	 ```matlab
	N = [20,15,25];
	P = eye(length(N));
	A = random_multi_bottleneck_graph(N,P); 
	spy(A)
	```
	![N = [20,15,25];
	P = [1,0,0; 
		 0,1,0; 
		 0,0,1];](/images/random_multi_bottleneck_simple_graph_ex3.png)
	
	You don't have to specify P if you want this.
		 
	4. Complete tripartite
	```matlab
	N = [20,15,25];
	P = ones(length(N), length(N)) - eye(length(N));
	A = random_multi_bottleneck_graph(N,P); 
	spy(A)
	```
	![N = [20,15,25];
	P = [0,1,1; 
		 1,0,1; 
		 1,1,0];](/images/random_multi_bottleneck_simple_graph_ex4.png)

	5. Weighted 
	```matlab
	N = [20,15,25];
	P = [.90,.10,.10; 
		 .10,.85,.20; 
		 .10,.20,.90];
	A = random_multi_bottleneck_graph(N,P,'weighted',true); 
	imagesc(A)
	colormap('jet')
	caxis([-1,1])
	colorbar
	```
	![weighted](/images/random_multi_bottleneck_simple_graph_ex5.png)
	
	6. Weighted and signed 
	```matlab
	N = [20,15,25];
	P = [.90,.10,.10; 
		 .10,.85,.20; 
		 .10,.20,.90];
	A = random_multi_bottleneck_graph(N,P,'weighted',true,'Signed',.5); 
	imagesc(A)
	colormap('jet')
	caxis([-1,1])
	colorbar
	```
	![weighted and signed](/images/random_multi_bottleneck_simple_graph_ex6.png)
	
	You can run the code without any inputs and it will return a graph on 40 vertices with two connected components where the connected components are complete graphs of sizes 10 and 15, respectively.
	
