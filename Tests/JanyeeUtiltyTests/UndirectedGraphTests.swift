import XCTest
import JanyeeUtilty
import Graph

class UndirectedGraphTests {
    let graph1 = UndirectedGraph(vertex: 13, edges: 13)
    let graph2 = UndirectedGraph(vertex: 6, edges: 8)
    let graph3 = UndirectedGraph(vertex: 37, edges: 44)
    
    init() {
        // init graph1
        graph1.addEdge(v: 0, w: 5)
        graph1.addEdge(v: 4, w: 3)
        graph1.addEdge(v: 0, w: 1)
        graph1.addEdge(v: 9, w: 12)
        graph1.addEdge(v: 6, w: 4)
        graph1.addEdge(v: 5, w: 4)
        graph1.addEdge(v: 0, w: 2)
        graph1.addEdge(v: 11, w: 12)
        graph1.addEdge(v: 9, w: 10)
        graph1.addEdge(v: 0, w: 6)
        graph1.addEdge(v: 7, w: 8)
        graph1.addEdge(v: 9, w: 11)
        graph1.addEdge(v: 5, w: 3)
        
        // init graph2
        graph2.addEdge(v: 0, w: 5)
        graph2.addEdge(v: 2, w: 4)
        graph2.addEdge(v: 2, w: 3)
        graph2.addEdge(v: 1, w: 2)
        graph2.addEdge(v: 0, w: 1)
        graph2.addEdge(v: 3, w: 4)
        graph2.addEdge(v: 3, w: 5)
        graph2.addEdge(v: 0, w: 2)
        
        // init graph3
        graph3.addEdge(v: 0, w: 5)
        graph3.addEdge(v: 4, w: 3)
        graph3.addEdge(v: 0, w: 1)
        graph3.addEdge(v: 9, w: 12)
        graph3.addEdge(v: 6, w: 4)
        graph3.addEdge(v: 5, w: 4)
        graph3.addEdge(v: 11, w: 12)
        graph3.addEdge(v: 9, w: 10)
        graph3.addEdge(v: 0, w: 6)
        graph3.addEdge(v: 7, w: 8)
        graph3.addEdge(v: 9, w: 11)
        graph3.addEdge(v: 5, w: 3)
        graph3.addEdge(v: 0, w: 30)
        graph3.addEdge(v: 8, w: 30)
        graph3.addEdge(v: 11, w: 30)
        graph3.addEdge(v: 12, w: 30)
        graph3.addEdge(v: 13, w: 30)
        graph3.addEdge(v: 14, w: 30)
        graph3.addEdge(v: 15, w: 30)
        graph3.addEdge(v: 16, w: 30)
        graph3.addEdge(v: 17, w: 30)
        graph3.addEdge(v: 18, w: 30)
        graph3.addEdge(v: 19, w: 30)
        graph3.addEdge(v: 29, w: 30)
        graph3.addEdge(v: 31, w: 30)
        graph3.addEdge(v: 31, w: 29)
        graph3.addEdge(v: 36, w: 29)
        graph3.addEdge(v: 36, w: 35)
        graph3.addEdge(v: 34, w: 35)
        graph3.addEdge(v: 34, w: 33)
        graph3.addEdge(v: 32, w: 33)
        graph3.addEdge(v: 32, w: 31)
        graph3.addEdge(v: 19, w: 18)
        graph3.addEdge(v: 19, w: 25)
        graph3.addEdge(v: 18, w: 25)
        graph3.addEdge(v: 18, w: 17)
        graph3.addEdge(v: 16, w: 17)
        graph3.addEdge(v: 16, w: 15)
        graph3.addEdge(v: 14, w: 15)
        graph3.addEdge(v: 14, w: 13)
        graph3.addEdge(v: 20, w: 13)
        graph3.addEdge(v: 20, w: 21)
        graph3.addEdge(v: 22, w: 21)
        graph3.addEdge(v: 22, w: 23)
        graph3.addEdge(v: 24, w: 20)
        graph3.addEdge(v: 24, w: 21)
        graph3.addEdge(v: 24, w: 22)
        graph3.addEdge(v: 24, w: 23)
        graph3.addEdge(v: 24, w: 28)
        graph3.addEdge(v: 27, w: 28)
        graph3.addEdge(v: 26, w: 28)
        graph3.addEdge(v: 25, w: 28)
    }
    
    func checkAdjustOfGraph1() {
        XCTAssert(graph1.adjust[0].sorted() == [6, 2, 1, 5].sorted(), "graph.adjust[\(0)] = \(graph1.adjust[0])")
        XCTAssert(graph1.adjust[1].sorted() == [0].sorted(), "graph.adjust[\(1)] = \(graph1.adjust[1])")
        XCTAssert(graph1.adjust[2].sorted() == [0].sorted(), "graph.adjust[\(2)] = \(graph1.adjust[2])")
        XCTAssert(graph1.adjust[3].sorted() == [5, 4].sorted(), "graph.adjust[\(3)] = \(graph1.adjust[3])")
        XCTAssert(graph1.adjust[4].sorted() == [6, 3, 5].sorted(), "graph.adjust[\(4)] = \(graph1.adjust[4])")
        XCTAssert(graph1.adjust[5].sorted() == [3, 4, 0].sorted(), "graph.adjust[\(5)] = \(graph1.adjust[5])")
        XCTAssert(graph1.adjust[6].sorted() == [0, 4].sorted(), "graph.adjust[\(6)] = \(graph1.adjust[6])")
        XCTAssert(graph1.adjust[7].sorted() == [8].sorted(), "graph.adjust[\(7)] = \(graph1.adjust[7])")
        XCTAssert(graph1.adjust[8].sorted() == [7].sorted(), "graph.adjust[\(8)] = \(graph1.adjust[8])")
        XCTAssert(graph1.adjust[9].sorted() == [11, 10, 12].sorted(), "graph.adjust[\(9)] = \(graph1.adjust[9])")
        XCTAssert(graph1.adjust[10].sorted() == [9].sorted(), "graph.adjust[\(10)] = \(graph1.adjust[10])")
        XCTAssert(graph1.adjust[11].sorted() == [9, 12].sorted(), "graph.adjust[\(11)] = \(graph1.adjust[11])")
        XCTAssert(graph1.adjust[12].sorted() == [11, 9].sorted(), "graph.adjust[\(12)] = \(graph1.adjust[12])")
    }
    
    func checkAdjustOfGraph2() {
        XCTAssert(graph2.adjust[0].sorted() == [5, 1, 2].sorted(), "graph.adjust[\(0)] = \(graph2.adjust[0])")
        XCTAssert(graph2.adjust[1].sorted() == [2].sorted(), "graph.adjust[\(1)] = \(graph2.adjust[1])")
        XCTAssert(graph2.adjust[2].sorted() == [4, 3].sorted(), "graph.adjust[\(2)] = \(graph2.adjust[2])")
        XCTAssert(graph2.adjust[3].sorted() == [4, 5].sorted(), "graph.adjust[\(3)] = \(graph2.adjust[3])")
        XCTAssert(graph2.adjust[4].sorted() == [2, 3].sorted(), "graph.adjust[\(4)] = \(graph2.adjust[4])")
        XCTAssert(graph2.adjust[5].sorted() == [0, 3].sorted(), "graph.adjust[\(5)] = \(graph2.adjust[5])")
    }
    
    func graph2DepthFirstSearchTest() {
        XCTAssertEqual(graph2.depthFirstSearch(source: 0).connected.sorted(), [0, 1, 2, 3, 4, 5])
        
        let depthFirstSearch = DepthFirstSearch(graph: graph2, source: 0)
//        depthFirstSearch.search(graph: graph2, v: 0)
        XCTAssertEqual(depthFirstSearch.connectedVertexes().sorted(), [0, 1, 2, 3, 4, 5])
        // 从 source 到 5 的路径
        let path = depthFirstSearch.pathTo(5)
        // 检测路径中每个路过的顶点是否都和起点 source 相同。
        // 如果 path 包含一个传递给 hasPathTo 并返回 false 的顶点，那么证明这个顶点不可达。
        // 当路径中有一个顶点与 source 不连通，那么这个 path 的设计有问题。
        // 因为正确的情况下，path 中的每个顶点都是与 source 连通的。
        XCTAssertFalse(path.contains(where: { e in depthFirstSearch.hasPathTo(e) == false }))
    }
    
    func parseGraphAndDepthFirstSearchTest() {
        // 将 GraphTest1.txt 的文本 parse 为 Graph 对象
        let graphText = JanyeeUtilty.readTextToFile(filename: "GraphTest1.txt")
        do {
            let graph = try UndirectedGraph(readText: graphText)
            XCTAssertEqual(graph.depthFirstSearch(source: 0).connected.sorted(),
                           (0...40).map( {e in e} ))
            let depthFirstSearch = DepthFirstSearch(graph: graph, source: 0)
//            depthFirstSearch.search(graph: graph, v: 0)
            XCTAssertEqual(depthFirstSearch.connectedVertexes().sorted(),
                           (0...40).map( {e in e} ))
            
            
            for v in 0...40 {
                let dfs = DepthFirstSearch(graph: graph, source: v)
                for item in 0...40 {
                    let path = dfs.pathTo(item)
                    print("\(v)-\(item) pathTo: \(path)")
                }
            }
            
        } catch is GraphError {
            fatalError("Throwing a GraphError.")
        } catch {
            fatalError("Unkown error.")
        }
    }

    static var allTests = [
        ("checkAdjustOfGraph1", checkAdjustOfGraph1),
        ("graph2DepthFirstSearchTest", graph2DepthFirstSearchTest),
        ("parseGraphAndDepthFirstSearchTest", parseGraphAndDepthFirstSearchTest),
    ]
}
