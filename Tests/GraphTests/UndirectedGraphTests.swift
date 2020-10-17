import XCTest
import Graph

final class UndirectedGraphTests: XCTestCase {
    let undirectedGraph1 = makeUndirectedGraph1()
    let undirectedGraph2 = makeUndirectedGraph2()
    let undirectedGraph3 = makeUndirectedGraph3()
    let undirectedGraph4 = makeUndirectedGraph4()
    
    func checkAdjustOfGraph1() {
        XCTAssert(undirectedGraph1.adjust[0].sorted() == [6, 2, 1, 5].sorted(), "graph.adjust[\(0)] = \(undirectedGraph1.adjust[0])")
        XCTAssert(undirectedGraph1.adjust[1].sorted() == [0].sorted(), "graph.adjust[\(1)] = \(undirectedGraph1.adjust[1])")
        XCTAssert(undirectedGraph1.adjust[2].sorted() == [0].sorted(), "graph.adjust[\(2)] = \(undirectedGraph1.adjust[2])")
        XCTAssert(undirectedGraph1.adjust[3].sorted() == [5, 4].sorted(), "graph.adjust[\(3)] = \(undirectedGraph1.adjust[3])")
        XCTAssert(undirectedGraph1.adjust[4].sorted() == [6, 3, 5].sorted(), "graph.adjust[\(4)] = \(undirectedGraph1.adjust[4])")
        XCTAssert(undirectedGraph1.adjust[5].sorted() == [3, 4, 0].sorted(), "graph.adjust[\(5)] = \(undirectedGraph1.adjust[5])")
        XCTAssert(undirectedGraph1.adjust[6].sorted() == [0, 4].sorted(), "graph.adjust[\(6)] = \(undirectedGraph1.adjust[6])")
        XCTAssert(undirectedGraph1.adjust[7].sorted() == [8].sorted(), "graph.adjust[\(7)] = \(undirectedGraph1.adjust[7])")
        XCTAssert(undirectedGraph1.adjust[8].sorted() == [7].sorted(), "graph.adjust[\(8)] = \(undirectedGraph1.adjust[8])")
        XCTAssert(undirectedGraph1.adjust[9].sorted() == [11, 10, 12].sorted(), "graph.adjust[\(9)] = \(undirectedGraph1.adjust[9])")
        XCTAssert(undirectedGraph1.adjust[10].sorted() == [9].sorted(), "graph.adjust[\(10)] = \(undirectedGraph1.adjust[10])")
        XCTAssert(undirectedGraph1.adjust[11].sorted() == [9, 12].sorted(), "graph.adjust[\(11)] = \(undirectedGraph1.adjust[11])")
        XCTAssert(undirectedGraph1.adjust[12].sorted() == [11, 9].sorted(), "graph.adjust[\(12)] = \(undirectedGraph1.adjust[12])")
    }
    
    func checkAdjustOfGraph2() {
        XCTAssert(undirectedGraph2.adjust[0].sorted() == [5, 1, 2].sorted(), "graph.adjust[\(0)] = \(undirectedGraph2.adjust[0])")
        XCTAssert(undirectedGraph2.adjust[1].sorted() == [2].sorted(), "graph.adjust[\(1)] = \(undirectedGraph2.adjust[1])")
        XCTAssert(undirectedGraph2.adjust[2].sorted() == [4, 3].sorted(), "graph.adjust[\(2)] = \(undirectedGraph2.adjust[2])")
        XCTAssert(undirectedGraph2.adjust[3].sorted() == [4, 5].sorted(), "graph.adjust[\(3)] = \(undirectedGraph2.adjust[3])")
        XCTAssert(undirectedGraph2.adjust[4].sorted() == [2, 3].sorted(), "graph.adjust[\(4)] = \(undirectedGraph2.adjust[4])")
        XCTAssert(undirectedGraph2.adjust[5].sorted() == [0, 3].sorted(), "graph.adjust[\(5)] = \(undirectedGraph2.adjust[5])")
    }
    
    func checkAdjustOfGraph3() {
        XCTAssert(undirectedGraph3.adjust[0].sorted() == [6, 2, 1, 5, 30].sorted())
        XCTAssert(undirectedGraph3.adjust[1].sorted() == [0].sorted())
        XCTAssert(undirectedGraph3.adjust[2].sorted() == [0].sorted())
        XCTAssert(undirectedGraph3.adjust[3].sorted() == [5, 4].sorted())
        XCTAssert(undirectedGraph3.adjust[4].sorted() == [6, 3, 5].sorted())
        XCTAssert(undirectedGraph3.adjust[5].sorted() == [3, 4, 0].sorted())
        XCTAssert(undirectedGraph3.adjust[6].sorted() == [0, 4].sorted())
        XCTAssert(undirectedGraph3.adjust[7].sorted() == [8].sorted())
        XCTAssert(undirectedGraph3.adjust[8].sorted() == [7, 30].sorted())
        XCTAssert(undirectedGraph3.adjust[9].sorted() == [11, 10, 12].sorted())
        XCTAssert(undirectedGraph3.adjust[10].sorted() == [9].sorted())
        XCTAssert(undirectedGraph3.adjust[11].sorted() == [9, 12, 30].sorted())
        XCTAssert(undirectedGraph3.adjust[12].sorted() == [11, 9, 30].sorted())
        XCTAssert(undirectedGraph3.adjust[13].sorted() == [30, 14, 20].sorted())
        XCTAssert(undirectedGraph3.adjust[14].sorted() == [30, 13, 15].sorted())
        XCTAssert(undirectedGraph3.adjust[15].sorted() == [30, 16, 14].sorted())
        XCTAssert(undirectedGraph3.adjust[16].sorted() == [30, 17, 15].sorted())
        XCTAssert(undirectedGraph3.adjust[17].sorted() == [30, 18, 16].sorted())
        XCTAssert(undirectedGraph3.adjust[18].sorted() == [30, 19, 25, 17].sorted())
        XCTAssert(undirectedGraph3.adjust[19].sorted() == [30, 25, 18].sorted())
        XCTAssert(undirectedGraph3.adjust[20].sorted() == [13, 21, 24].sorted())
        XCTAssert(undirectedGraph3.adjust[21].sorted() == [20, 22, 24].sorted())
        XCTAssert(undirectedGraph3.adjust[22].sorted() == [21, 23, 24].sorted())
        XCTAssert(undirectedGraph3.adjust[23].sorted() == [22, 24].sorted())
        XCTAssert(undirectedGraph3.adjust[24].sorted() == [20, 21, 22, 23, 28].sorted())
        XCTAssert(undirectedGraph3.adjust[25].sorted() == [18, 19, 28].sorted())
        XCTAssert(undirectedGraph3.adjust[26].sorted() == [28].sorted())
        XCTAssert(undirectedGraph3.adjust[27].sorted() == [28].sorted())
        XCTAssert(undirectedGraph3.adjust[28].sorted() == [24, 25, 26, 27].sorted())
        XCTAssert(undirectedGraph3.adjust[29].sorted() == [30, 31, 36].sorted())
        XCTAssert(undirectedGraph3.adjust[30].sorted() == [0, 8, 11, 12, 13, 14, 15, 16, 17, 18, 19, 29, 31].sorted())
        XCTAssert(undirectedGraph3.adjust[31].sorted() == [30, 29 ,32].sorted())
        XCTAssert(undirectedGraph3.adjust[32].sorted() == [31, 33].sorted())
        XCTAssert(undirectedGraph3.adjust[33].sorted() == [32, 34].sorted())
        XCTAssert(undirectedGraph3.adjust[34].sorted() == [33, 35].sorted())
        XCTAssert(undirectedGraph3.adjust[35].sorted() == [34, 36].sorted())
        XCTAssert(undirectedGraph3.adjust[36].sorted() == [35, 29].sorted())
    }
    
    func graph2DFSTest() {
        let depthFirstSearch = undirectedGraph2.depthFirstSearcher(source: 0)
//        depthFirstSearch.search(graph: graph2, v: 0)
        XCTAssertEqual(depthFirstSearch.connectedVertexes().sorted(), [0, 1, 2, 3, 4, 5])
        // 从 source 到 5 的路径
        let path = depthFirstSearch.pathTo(5)
        // 检测路径中每个路过的顶点是否都和起点 source 连通。
        // 如果 path 包含一个传递给 hasPathTo 并返回 false 的顶点，那么证明这个顶点不可达。
        // 当路径中有一个顶点与 source 不连通，那么这个 path 的设计有问题。
        // 因为正确的情况下，path 中的每个顶点都是与 source 连通的。
        XCTAssertFalse(path.contains(where: { e in depthFirstSearch.hasPathTo(e) == false }))
    }
    
    func graph2BFSTest() {
        print("graph2BFSTest...")
        let bfs = undirectedGraph2.breadthFirstSearcher(source: 0)
        XCTAssert(bfs.pathTo(0) == [0])
        XCTAssert(bfs.pathTo(1) == [1, 0])
        XCTAssert(bfs.pathTo(2) == [2, 0])
        XCTAssert(bfs.pathTo(3) == [3, 5, 0])
        XCTAssert(bfs.pathTo(4) == [4, 2, 0])
        XCTAssert(bfs.pathTo(5) == [5, 0])
    }
    
    // 测试通过 DFS 产生的路径列表中的每个 vertex 是否能与 source 连通
    func graph2DFSPathTest() {
        for s in 0...5 {
            let dfs = undirectedGraph2.depthFirstSearcher(source: s)
            for v in 0...5 {
                XCTAssert(dfs.hasPathTo(v))
            }
        }
    }
    
    // 测试通过 DFS 产生的路径列表中的每个 vertex 是否能与 source 连通
    func graph3DFSPathTest() {
        for s in 0...36 {
            let dfs = undirectedGraph3.depthFirstSearcher(source: s)
            for v in 0...36 {
                XCTAssert(dfs.hasPathTo(v))
            }
        }
    }
    
    func graph3BFSTest() {
        let bfs = undirectedGraph3.breadthFirstSearcher(source: 0)
        XCTAssert(bfs.pathTo(0) == [0])
    }
    
    // 测试 graph3 所有顶点的度数
    func graph3DegreeTest() {
        XCTAssert(undirectedGraph3.degree(vertex: 0) == 5)
        XCTAssert(undirectedGraph3.degree(vertex: 1) == 1)
        XCTAssert(undirectedGraph3.degree(vertex: 2) == 1)
        XCTAssert(undirectedGraph3.degree(vertex: 3) == 2)
        XCTAssert(undirectedGraph3.degree(vertex: 4) == 3)
        XCTAssert(undirectedGraph3.degree(vertex: 5) == 3)
        XCTAssert(undirectedGraph3.degree(vertex: 6) == 2)
        XCTAssert(undirectedGraph3.degree(vertex: 7) == 1)
        XCTAssert(undirectedGraph3.degree(vertex: 8) == 2)
        XCTAssert(undirectedGraph3.degree(vertex: 9) == 3)
        XCTAssert(undirectedGraph3.degree(vertex: 10) == 1)
        XCTAssert(undirectedGraph3.degree(vertex: 11) == 3)
        XCTAssert(undirectedGraph3.degree(vertex: 12) == 3)
        XCTAssert(undirectedGraph3.degree(vertex: 13) == 3)
        XCTAssert(undirectedGraph3.degree(vertex: 14) == 3)
        XCTAssert(undirectedGraph3.degree(vertex: 15) == 3)
        XCTAssert(undirectedGraph3.degree(vertex: 16) == 3)
        XCTAssert(undirectedGraph3.degree(vertex: 17) == 3)
        XCTAssert(undirectedGraph3.degree(vertex: 18) == 4)
        XCTAssert(undirectedGraph3.degree(vertex: 19) == 3)
        XCTAssert(undirectedGraph3.degree(vertex: 20) == 3)
        XCTAssert(undirectedGraph3.degree(vertex: 21) == 3)
        XCTAssert(undirectedGraph3.degree(vertex: 22) == 3)
        XCTAssert(undirectedGraph3.degree(vertex: 23) == 2)
        XCTAssert(undirectedGraph3.degree(vertex: 24) == 5)
        XCTAssert(undirectedGraph3.degree(vertex: 25) == 3)
        XCTAssert(undirectedGraph3.degree(vertex: 26) == 1)
        XCTAssert(undirectedGraph3.degree(vertex: 27) == 1)
        XCTAssert(undirectedGraph3.degree(vertex: 28) == 4)
        XCTAssert(undirectedGraph3.degree(vertex: 29) == 3)
        XCTAssert(undirectedGraph3.degree(vertex: 30) == 13)
        XCTAssert(undirectedGraph3.degree(vertex: 31) == 3)
        XCTAssert(undirectedGraph3.degree(vertex: 32) == 2)
        XCTAssert(undirectedGraph3.degree(vertex: 33) == 2)
        XCTAssert(undirectedGraph3.degree(vertex: 34) == 2)
        XCTAssert(undirectedGraph3.degree(vertex: 35) == 2)
        XCTAssert(undirectedGraph3.degree(vertex: 36) == 2)
    }
    
    func graph4DFSTest() {
        XCTAssertEqual(undirectedGraph4.depthFirstSearcher(source: 0).connectedVertexes().sorted(),
                       (0...40).map( {e in e} ))
        
        // 打印出发点(0...40)与目标(0...40)的交叉连接产生的路径
        for v in 0...40 {
            let dfs = DepthFirstSearch(graph: undirectedGraph4, source: v)
            for item in 0...40 {
                let path = dfs.pathTo(item)
                print("\(v)-\(item) pathTo: \(path)")
            }
        }
    }
    
    func graph4BFSTest() {
        let bfs = undirectedGraph4.breadthFirstSearcher(source: 0)
        XCTAssert(bfs.pathTo(0) == [0])
    }
    
    // 检测 graph 的连通性
    func connectedGraphTest() {
        func isConnectedGraph<G: Graphable>(graph: G) -> Bool {
            for s in 0..<graph.adjust.count {
                let dfs = graph.depthFirstSearcher(source: s)
                for s2 in 0..<graph.adjust.count {
                    if dfs.hasPathTo(s2) == false {
                        return false
                    }
                }
            }
            return true
        }
        /*
         在这个测试用例中，graph1是不连通图，
         graph2 、 graph3 和 graph4 是连通图
         */
        // by dfs
        XCTAssertFalse(isConnectedGraph(graph: undirectedGraph1))
        XCTAssertTrue(isConnectedGraph(graph: undirectedGraph2))
        XCTAssertTrue(isConnectedGraph(graph: undirectedGraph3))
        XCTAssertTrue(isConnectedGraph(graph: undirectedGraph4))
        
        // 让 graph3 不再连通
        undirectedGraph3.addEdge(v: undirectedGraph3.adjust.count, w: undirectedGraph3.adjust.count + 1)
        XCTAssertFalse(isConnectedGraph(graph: undirectedGraph3))
        
        // 让 graph4 不再连通
        undirectedGraph4.addEdge(v: 41, w: 42)
        XCTAssertFalse(isConnectedGraph(graph: undirectedGraph4))
        
        // by bfs
    }
    
    func testMain() {
        for test in Self.allTests {
            print("Test \(test.0) start...")
            test.1(self)()
        }
    }

    static var allTests = [
        ("checkAdjustOfGraph1", checkAdjustOfGraph1),
        ("checkAdjustOfGraph3", checkAdjustOfGraph3),
        ("graph2DFSTest", graph2DFSTest),
        ("graph2DFSPathTest", graph2DFSPathTest),
        ("graph3DFSPathTest", graph3DFSPathTest),
        ("graph4DFSTest", graph4DFSTest),
        ("graph4BFSTest", graph4BFSTest),
        ("graph3DegreeTest", graph3DegreeTest),
        ("connectedGraphTest", connectedGraphTest),
        ("graph2BFSTest", graph2BFSTest),
        ("graph3BFSTest", graph3BFSTest),
    ]
}
