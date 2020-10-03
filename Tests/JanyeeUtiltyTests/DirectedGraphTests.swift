import XCTest
import JanyeeUtilty
import Graph

class DirectedGraphTests {
    let graph1 = DirectedGraph(vertex: 13, edges: 13)
    let graph2 = DirectedGraph(vertex: 6, edges: 8)
    let graph3 = DirectedGraph(vertex: 37, edges: 44)
    // 将 GraphTest1.txt 的文本 parse 为 Graph 对象
    let graph4: DirectedGraph
    
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
        
        // init graph4
        do {
            graph4 = try DirectedGraph(readText: JanyeeUtilty.readTextToFile(filename: "GraphTest1.txt"))
        } catch is GraphError {
            fatalError("Throwing a GraphError.")
        } catch {
            fatalError("Unkown error.")
        }
    }
    
    func checkAdjustOfGraph1() {
        XCTAssertTrue(graph1.adjust[0].sorted() == [6, 2, 1, 5].sorted())
        XCTAssertFalse(graph1.adjust[1] == [0])
        XCTAssertFalse(graph1.adjust[2] == [0])
        XCTAssertFalse(graph1.adjust[3].sorted() == [5, 4].sorted())
        XCTAssertFalse(graph1.adjust[4].sorted() == [6, 3, 5].sorted())
        XCTAssertFalse(graph1.adjust[5].sorted() == [3, 4, 0].sorted())
        XCTAssertFalse(graph1.adjust[6].sorted() == [0, 4].sorted())
        XCTAssertTrue(graph1.adjust[7] == [8])
        XCTAssertFalse(graph1.adjust[8] == [7])
        XCTAssert(graph1.adjust[9].sorted() == [11, 10, 12].sorted())
        XCTAssertFalse(graph1.adjust[10].sorted() == [9].sorted())
        XCTAssertFalse(graph1.adjust[11].sorted() == [9, 12].sorted())
        XCTAssertFalse(graph1.adjust[12].sorted() == [11, 9].sorted())
        
        XCTAssertTrue(graph1.adjust[1] == [])
        XCTAssertTrue(graph1.adjust[2] == [])
        XCTAssertTrue(graph1.adjust[3] == [])
        XCTAssertTrue(graph1.adjust[4] == [3])
        XCTAssertTrue(graph1.adjust[5].sorted() == [3, 4].sorted())
        XCTAssertTrue(graph1.adjust[6] == [4])
        XCTAssertTrue(graph1.adjust[8] == [])
        XCTAssertTrue(graph1.adjust[10] == [])
        XCTAssertTrue(graph1.adjust[11] == [12])
        XCTAssertTrue(graph1.adjust[12] == [])
    }
    
    func checkAdjustOfGraph2() {
        XCTAssert(graph2.adjust[0].sorted() == [5, 1, 2].sorted())
        XCTAssert(graph2.adjust[1] == [2])
        XCTAssert(graph2.adjust[2].sorted() == [4, 3].sorted())
        XCTAssert(graph2.adjust[3].sorted() == [4, 5].sorted())
        XCTAssertFalse(graph2.adjust[4].sorted() == [2, 3].sorted())
        XCTAssertTrue(graph2.adjust[4] == [])
        XCTAssertFalse(graph2.adjust[5].sorted() == [0, 3].sorted())
        XCTAssertTrue(graph2.adjust[5] == [])
    }
    
    func checkAdjustOfGraph3() {
        XCTAssert(graph3.adjust[0].sorted() == [6, 2, 1, 5, 30].sorted())
        XCTAssert(graph3.adjust[1] == [])
        XCTAssert(graph3.adjust[2] == [])
        XCTAssert(graph3.adjust[3] == [])
        XCTAssert(graph3.adjust[4] == [3])
        XCTAssert(graph3.adjust[5].sorted() == [3, 4].sorted())
        XCTAssert(graph3.adjust[6] == [4])
        XCTAssert(graph3.adjust[7] == [8])
        XCTAssert(graph3.adjust[8] == [30])
        XCTAssert(graph3.adjust[9].sorted() == [11, 10, 12].sorted())
        XCTAssert(graph3.adjust[10] == [])
        XCTAssert(graph3.adjust[11].sorted() == [12, 30].sorted())
        XCTAssert(graph3.adjust[12] == [30])
        XCTAssert(graph3.adjust[13] == [30])
        XCTAssert(graph3.adjust[14].sorted() == [30, 13, 15].sorted())
        XCTAssert(graph3.adjust[15] == [30])
        XCTAssert(graph3.adjust[16].sorted() == [17, 15, 30].sorted())
        XCTAssert(graph3.adjust[17] == [30])
        XCTAssert(graph3.adjust[18].sorted() == [30, 25, 17].sorted())
        XCTAssert(graph3.adjust[19].sorted() == [30, 25, 18].sorted())
        XCTAssert(graph3.adjust[20].sorted() == [13, 21].sorted())
        XCTAssert(graph3.adjust[21] == [])
        XCTAssert(graph3.adjust[22].sorted() == [21, 23].sorted())
        XCTAssert(graph3.adjust[23] == [])
        XCTAssert(graph3.adjust[24].sorted() == [20, 21, 22, 23, 28].sorted())
        XCTAssert(graph3.adjust[25] == [28])
        XCTAssert(graph3.adjust[26] == [28])
        XCTAssert(graph3.adjust[27] == [28])
        XCTAssert(graph3.adjust[28] == [])
        XCTAssert(graph3.adjust[29] == [30])
        XCTAssert(graph3.adjust[30] == [])
        XCTAssert(graph3.adjust[31].sorted() == [30, 29].sorted())
        XCTAssert(graph3.adjust[32].sorted() == [31, 33].sorted())
        XCTAssert(graph3.adjust[33] == [])
        XCTAssert(graph3.adjust[34].sorted() == [33, 35].sorted())
        XCTAssert(graph3.adjust[35] == [])
        XCTAssert(graph3.adjust[36].sorted() == [35, 29].sorted())
    }
    
    func graph2DFSTest() {
        // 检测路径中每个路过的顶点是否都和起点 source 连通。
        // 如果 path 包含一个传递给 hasPathTo 并返回 false 的顶点，那么证明这个顶点不可达。
        // 当路径中有一个顶点与 source 不连通，那么这个 path 的设计有问题。
        // 因为正确的情况下，path 中的每个顶点都是与 source 连通的。
        // 如果返回值为 false，表明这个 path 是正确的（即 path 中的每个顶点都与 source 连通）；
        // 返回 true 表明 path 设计上有问题。
        func isNotConnected(path: [Int]) -> Bool {
            return path.contains(where: { e in depthFirstSearch.hasPathTo(e) == false })
        }
        
        
        ////////////////////// 基于起点 0 进行测试 //////////////////////
        var depthFirstSearch = graph2.depthFirstSearcher(source: 0)
        XCTAssertEqual(depthFirstSearch.connectedVertexes().sorted(), [0, 1, 2, 3, 4, 5])
        // 检测 source 到 source...5 的路径是否可以连通
        for target in 0...5 {
            let path = depthFirstSearch.pathTo(target)
            // 断言为 false 表明测试通过
            XCTAssertFalse(isNotConnected(path: path))
        }
        
        ////////////////////// 基于起点 1 进行测试 //////////////////////
        depthFirstSearch = graph2.depthFirstSearcher(source: 1)
        XCTAssertEqual(depthFirstSearch.connectedVertexes().sorted(), [1, 2, 3, 4, 5])
        // 检测 source 到 source...5 的路径是否可以连通
        for target in 1...5 {
            let path = depthFirstSearch.pathTo(target)
            // 断言为 false 表明测试通过
            XCTAssertFalse(isNotConnected(path: path))
        }
        // 起点 1 无法与 0 连通
        XCTAssertTrue(isNotConnected(path: depthFirstSearch.pathTo(0)))
    }
    
    func graph2BFSTest() {
        print("graph2BFSTest...")
        let bfs = graph2.breadthFirstSearcher(source: 0)
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
            let dfs = graph2.depthFirstSearcher(source: s)
            for v in 0...5 {
                XCTAssert(dfs.hasPathTo(v))
            }
        }
    }
    
    // 测试通过 DFS 产生的路径列表中的每个 vertex 是否能与 source 连通
    func graph3DFSPathTest() {
        for s in 0...36 {
            let dfs = graph3.depthFirstSearcher(source: s)
            for v in 0...36 {
                XCTAssert(dfs.hasPathTo(v))
            }
        }
    }
    
    func graph3BFSTest() {
        let bfs = graph3.breadthFirstSearcher(source: 0)
        XCTAssert(bfs.pathTo(0) == [0])
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
    
    func graph4DFSTest() {
        XCTAssertEqual(graph4.depthFirstSearcher(source: 0).connectedVertexes().sorted(),
                       (0...40).map( {e in e} ))
        
        // 打印出发点(0...40)与目标(0...40)的交叉连接产生的路径
        for v in 0...40 {
            let dfs = DepthFirstSearch(graph: graph4, source: v)
            for item in 0...40 {
                let path = dfs.pathTo(item)
                print("\(v)-\(item) pathTo: \(path)")
            }
        }
    }
    
    func graph4BFSTest() {
        let bfs = graph4.breadthFirstSearcher(source: 0)
        XCTAssert(bfs.pathTo(0) == [0])
    }
    
    // 检测 graph 的连通性
    func connectedGraphTest() {
        func isConnectedGraph(graph: Graphable) -> Bool {
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
        XCTAssertFalse(isConnectedGraph(graph: graph1))
        XCTAssertTrue(isConnectedGraph(graph: graph2))
        XCTAssertTrue(isConnectedGraph(graph: graph3))
        XCTAssertTrue(isConnectedGraph(graph: graph4))
        
        // 让 graph3 不再连通
        graph3.addEdge(v: graph3.adjust.count, w: graph3.adjust.count + 1)
        XCTAssertFalse(isConnectedGraph(graph: graph3))
        
        // 让 graph4 不再连通
        graph4.addEdge(v: 41, w: 42)
        XCTAssertFalse(isConnectedGraph(graph: graph4))
        
        // by bfs
    }

    static var allTests = [
        ("checkAdjustOfGraph1", checkAdjustOfGraph1),
        ("checkAdjustOfGraph2", checkAdjustOfGraph2),
        ("checkAdjustOfGraph3", checkAdjustOfGraph3),
        ("graph2DFSTest", graph2DFSTest),
//        ("graph2DFSPathTest", graph2DFSPathTest),
//        ("graph3DFSPathTest", graph3DFSPathTest),
//        ("graph4DFSTest", graph4DFSTest),
//        ("graph4BFSTest", graph4BFSTest),
//        ("graph3DegreeTest", graph3DegreeTest),
//        ("connectedGraphTest", connectedGraphTest),
//        ("graph2BFSTest", graph2BFSTest),
//        ("graph3BFSTest", graph3BFSTest),
    ]
}
