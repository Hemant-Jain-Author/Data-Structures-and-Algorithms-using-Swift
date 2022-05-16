import Foundation;
class MultipleStageGraph
{
    var INF : Int = Int.max;
    
    // Returns shortest distance from 0 to N-1.
    func shortestDist(_ graph : inout [[Int]], _ n : Int) -> Int
    {
        // dist[i] is going to store shortest
        // distance from node i to node n-1.
        let dist : [Int] = Array(repeating: 0, count: n);
        Arrays.fill( &dist,INF);
        let path : [Int] = Array(repeating: 0, count: n);
        var value : Int;
        dist[0] = 0;
        path[0] = -1;
        do
        {
            i : Int = 0;
            // Calculating shortest path for the nodes
            while (i < n)
            {
                do
                {
                    j : Int = i;
                    // Check all nodes of next
                    while (j < n)
                    {
                        // Reject if no edge exists
                        if (graph[i][j] == INF)
                        {
                            continue;
                        }
                        value = graph[i][j] + dist[i];
                        if (dist[j] > value)
                        {
                            dist[j] = value;
                            path[j] = i;
                        }
                        j += 1;
                    }
                }
                i += 1;
            }
        }
        value = n - 1;
        while (value != -1)
        {
            print(" " + String(value),terminator: "");
            value = path[value];
        }
        print();
        return dist[n - 1];
    }
    // Testing code.
    func main(_ args : inout [String])
    {
        // Graph stored in the form of an
        // adjacency Matrix
        let graph : [[Int]] = nil
        [
        [INF, 1, 2, 5, INF, INF, INF, INF],
        [INF, INF, INF, INF, 4, 11, INF, INF],
        [INF, INF, INF, INF, 9, 5, 16, INF],
        [INF, INF, INF, INF, INF, INF, 2, INF],
        [INF, INF, INF, INF, INF, INF, INF, 18],
        [INF, INF, INF, INF, INF, INF, INF, 13],
        [INF, INF, INF, INF, INF, INF, INF, 2],
        [INF, INF, INF, INF, INF, INF, INF, INF]];
        print(shortestDist( &graph,8));
    }
}

var record : [String] = CommandLine.arguments;
main(&record);