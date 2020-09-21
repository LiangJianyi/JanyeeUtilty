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
        graph3.addEdge(v: 0, w: 2)
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
    
    func checkAdjustOfGraph3() {
        XCTAssert(graph3.adjust[0].sorted() == [6, 2, 1, 5, 30].sorted())
        XCTAssert(graph3.adjust[1].sorted() == [0].sorted())
        XCTAssert(graph3.adjust[2].sorted() == [0].sorted())
        XCTAssert(graph3.adjust[3].sorted() == [5, 4].sorted())
        XCTAssert(graph3.adjust[4].sorted() == [6, 3, 5].sorted())
        XCTAssert(graph3.adjust[5].sorted() == [3, 4, 0].sorted())
        XCTAssert(graph3.adjust[6].sorted() == [0, 4].sorted())
        XCTAssert(graph3.adjust[7].sorted() == [8].sorted())
        XCTAssert(graph3.adjust[8].sorted() == [7, 30].sorted())
        XCTAssert(graph3.adjust[9].sorted() == [11, 10, 12].sorted())
        XCTAssert(graph3.adjust[10].sorted() == [9].sorted())
        XCTAssert(graph3.adjust[11].sorted() == [9, 12, 30].sorted())
        XCTAssert(graph3.adjust[12].sorted() == [11, 9, 30].sorted())
        XCTAssert(graph3.adjust[13].sorted() == [30, 14, 20].sorted())
        XCTAssert(graph3.adjust[14].sorted() == [30, 13, 15].sorted())
        XCTAssert(graph3.adjust[15].sorted() == [30, 16, 14].sorted())
        XCTAssert(graph3.adjust[16].sorted() == [30, 17, 15].sorted())
        XCTAssert(graph3.adjust[17].sorted() == [30, 18, 16].sorted())
        XCTAssert(graph3.adjust[18].sorted() == [30, 19, 25, 17].sorted())
        XCTAssert(graph3.adjust[19].sorted() == [30, 25, 18].sorted())
        XCTAssert(graph3.adjust[20].sorted() == [13, 21, 24].sorted())
        XCTAssert(graph3.adjust[21].sorted() == [20, 22, 24].sorted())
        XCTAssert(graph3.adjust[22].sorted() == [21, 23, 24].sorted())
        XCTAssert(graph3.adjust[23].sorted() == [22, 24].sorted())
        XCTAssert(graph3.adjust[24].sorted() == [20, 21, 22, 23, 28].sorted())
        XCTAssert(graph3.adjust[25].sorted() == [18, 19, 28].sorted())
        XCTAssert(graph3.adjust[26].sorted() == [28].sorted())
        XCTAssert(graph3.adjust[27].sorted() == [28].sorted())
        XCTAssert(graph3.adjust[28].sorted() == [24, 25, 26, 27].sorted())
        XCTAssert(graph3.adjust[29].sorted() == [30, 31, 36].sorted())
        XCTAssert(graph3.adjust[30].sorted() == [0, 8, 11, 12, 13, 14, 15, 16, 17, 18, 19, 29, 31].sorted())
        XCTAssert(graph3.adjust[31].sorted() == [30, 29 ,32].sorted())
        XCTAssert(graph3.adjust[32].sorted() == [31, 33].sorted())
        XCTAssert(graph3.adjust[33].sorted() == [32, 34].sorted())
        XCTAssert(graph3.adjust[34].sorted() == [33, 35].sorted())
        XCTAssert(graph3.adjust[35].sorted() == [34, 36].sorted())
        XCTAssert(graph3.adjust[36].sorted() == [35, 29].sorted())
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
    
    // 测试 graph3 所有顶点的度数
    func graph3DegreeTest() {
        XCTAssert(graph3.degree(vertex: 0) == 5)
        XCTAssert(graph3.degree(vertex: 1) == 1)
        XCTAssert(graph3.degree(vertex: 2) == 1)
        XCTAssert(graph3.degree(vertex: 3) == 2)
        XCTAssert(graph3.degree(vertex: 4) == 3)
        XCTAssert(graph3.degree(vertex: 5) == 3)
        XCTAssert(graph3.degree(vertex: 6) == 2)
        XCTAssert(graph3.degree(vertex: 7) == 1)
        XCTAssert(graph3.degree(vertex: 8) == 2)
        XCTAssert(graph3.degree(vertex: 9) == 3)
        XCTAssert(graph3.degree(vertex: 10) == 1)
        XCTAssert(graph3.degree(vertex: 11) == 3)
        XCTAssert(graph3.degree(vertex: 12) == 3)
        XCTAssert(graph3.degree(vertex: 13) == 3)
        XCTAssert(graph3.degree(vertex: 14) == 3)
        XCTAssert(graph3.degree(vertex: 15) == 3)
        XCTAssert(graph3.degree(vertex: 16) == 3)
        XCTAssert(graph3.degree(vertex: 17) == 3)
        XCTAssert(graph3.degree(vertex: 18) == 4)
        XCTAssert(graph3.degree(vertex: 19) == 3)
        XCTAssert(graph3.degree(vertex: 20) == 3)
        XCTAssert(graph3.degree(vertex: 21) == 3)
        XCTAssert(graph3.degree(vertex: 22) == 3)
        XCTAssert(graph3.degree(vertex: 23) == 2)
        XCTAssert(graph3.degree(vertex: 24) == 5)
        XCTAssert(graph3.degree(vertex: 25) == 3)
        XCTAssert(graph3.degree(vertex: 26) == 1)
        XCTAssert(graph3.degree(vertex: 27) == 1)
        XCTAssert(graph3.degree(vertex: 28) == 4)
        XCTAssert(graph3.degree(vertex: 29) == 3)
        XCTAssert(graph3.degree(vertex: 30) == 13)
        XCTAssert(graph3.degree(vertex: 31) == 3)
        XCTAssert(graph3.degree(vertex: 32) == 2)
        XCTAssert(graph3.degree(vertex: 33) == 2)
        XCTAssert(graph3.degree(vertex: 34) == 2)
        XCTAssert(graph3.degree(vertex: 35) == 2)
        XCTAssert(graph3.degree(vertex: 36) == 2)
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
        ("checkAdjustOfGraph3", checkAdjustOfGraph3),
        ("graph2DepthFirstSearchTest", graph2DepthFirstSearchTest),
        ("parseGraphAndDepthFirstSearchTest", parseGraphAndDepthFirstSearchTest),
        ("graph3DegreeTest", graph3DegreeTest)
    ]
}
