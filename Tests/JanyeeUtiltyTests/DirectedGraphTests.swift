import XCTest
import Graph

class DirectedGraphTests {
    let directedGraph1 = makeDirectedGraph1()
    let directedGraph2 = makeDirectedGraph2()
    let directedGraph3 = makeDirectedGraph3()
    let directedGraph4 = makeDirectedGraph4()
    
    func checkAdjustOfGraph1() {
        XCTAssertTrue(directedGraph1.adjust[0].sorted() == [6, 2, 1, 5].sorted())
        XCTAssertFalse(directedGraph1.adjust[1] == [0])
        XCTAssertFalse(directedGraph1.adjust[2] == [0])
        XCTAssertFalse(directedGraph1.adjust[3].sorted() == [5, 4].sorted())
        XCTAssertFalse(directedGraph1.adjust[4].sorted() == [6, 3, 5].sorted())
        XCTAssertFalse(directedGraph1.adjust[5].sorted() == [3, 4, 0].sorted())
        XCTAssertFalse(directedGraph1.adjust[6].sorted() == [0, 4].sorted())
        XCTAssertTrue(directedGraph1.adjust[7] == [8])
        XCTAssertFalse(directedGraph1.adjust[8] == [7])
        XCTAssert(directedGraph1.adjust[9].sorted() == [11, 10, 12].sorted())
        XCTAssertFalse(directedGraph1.adjust[10].sorted() == [9].sorted())
        XCTAssertFalse(directedGraph1.adjust[11].sorted() == [9, 12].sorted())
        XCTAssertFalse(directedGraph1.adjust[12].sorted() == [11, 9].sorted())
        
        XCTAssertTrue(directedGraph1.adjust[1] == [])
        XCTAssertTrue(directedGraph1.adjust[2] == [])
        XCTAssertTrue(directedGraph1.adjust[3] == [])
        XCTAssertTrue(directedGraph1.adjust[4] == [3])
        XCTAssertTrue(directedGraph1.adjust[5].sorted() == [3, 4].sorted())
        XCTAssertTrue(directedGraph1.adjust[6] == [4])
        XCTAssertTrue(directedGraph1.adjust[8] == [])
        XCTAssertTrue(directedGraph1.adjust[10] == [])
        XCTAssertTrue(directedGraph1.adjust[11] == [12])
        XCTAssertTrue(directedGraph1.adjust[12] == [])
    }
    
    func checkAdjustOfGraph2() {
        XCTAssert(directedGraph2.adjust[0].sorted() == [5, 1, 2].sorted())
        XCTAssert(directedGraph2.adjust[1] == [2])
        XCTAssert(directedGraph2.adjust[2].sorted() == [4, 3].sorted())
        XCTAssert(directedGraph2.adjust[3].sorted() == [4, 5].sorted())
        XCTAssertFalse(directedGraph2.adjust[4].sorted() == [2, 3].sorted())
        XCTAssertTrue(directedGraph2.adjust[4] == [])
        XCTAssertFalse(directedGraph2.adjust[5].sorted() == [0, 3].sorted())
        XCTAssertTrue(directedGraph2.adjust[5] == [])
    }
    
    func checkAdjustOfGraph3() {
        XCTAssert(directedGraph3.adjust[0].sorted() == [6, 2, 1, 5, 30].sorted())
        XCTAssert(directedGraph3.adjust[1] == [])
        XCTAssert(directedGraph3.adjust[2] == [])
        XCTAssert(directedGraph3.adjust[3] == [])
        XCTAssert(directedGraph3.adjust[4] == [3])
        XCTAssert(directedGraph3.adjust[5].sorted() == [3, 4].sorted())
        XCTAssert(directedGraph3.adjust[6] == [4])
        XCTAssert(directedGraph3.adjust[7] == [8])
        XCTAssert(directedGraph3.adjust[8] == [30])
        XCTAssert(directedGraph3.adjust[9].sorted() == [11, 10, 12].sorted())
        XCTAssert(directedGraph3.adjust[10] == [])
        XCTAssert(directedGraph3.adjust[11].sorted() == [12, 30].sorted())
        XCTAssert(directedGraph3.adjust[12] == [30])
        XCTAssert(directedGraph3.adjust[13] == [30])
        XCTAssert(directedGraph3.adjust[14].sorted() == [30, 13, 15].sorted())
        XCTAssert(directedGraph3.adjust[15] == [30])
        XCTAssert(directedGraph3.adjust[16].sorted() == [17, 15, 30].sorted())
        XCTAssert(directedGraph3.adjust[17] == [30])
        XCTAssert(directedGraph3.adjust[18].sorted() == [30, 25, 17].sorted())
        XCTAssert(directedGraph3.adjust[19].sorted() == [30, 25, 18].sorted())
        XCTAssert(directedGraph3.adjust[20].sorted() == [13, 21].sorted())
        XCTAssert(directedGraph3.adjust[21] == [])
        XCTAssert(directedGraph3.adjust[22].sorted() == [21, 23].sorted())
        XCTAssert(directedGraph3.adjust[23] == [])
        XCTAssert(directedGraph3.adjust[24].sorted() == [20, 21, 22, 23, 28].sorted())
        XCTAssert(directedGraph3.adjust[25] == [28])
        XCTAssert(directedGraph3.adjust[26] == [28])
        XCTAssert(directedGraph3.adjust[27] == [28])
        XCTAssert(directedGraph3.adjust[28] == [])
        XCTAssert(directedGraph3.adjust[29] == [30])
        XCTAssert(directedGraph3.adjust[30] == [])
        XCTAssert(directedGraph3.adjust[31].sorted() == [30, 29].sorted())
        XCTAssert(directedGraph3.adjust[32].sorted() == [31, 33].sorted())
        XCTAssert(directedGraph3.adjust[33] == [])
        XCTAssert(directedGraph3.adjust[34].sorted() == [33, 35].sorted())
        XCTAssert(directedGraph3.adjust[35] == [])
        XCTAssert(directedGraph3.adjust[36].sorted() == [35, 29].sorted())
    }
    
    func graph2DFSTest() {
        // 检测路径中每个路过的顶点是否都和起点 source 连通。
        // 如果 path 包含一个传递给 hasPathTo 并返回 false 的顶点，那么证明这个顶点不可达。
        // 当路径中有一个顶点与 source 不连通，那么这个 path 的设计有问题。
        // 因为正确的情况下，path 中的每个顶点都是与 source 连通的。
        // 如果返回值为 false，表明这个 path 是正确的（即 path 中的每个顶点都与 source 连通）；
        // 返回 true 表明 path 设计上有问题。
        func isNotConnected(path: [Int]) -> Bool {
            if path.count == 0 {
                return true
            } else {
                return path.contains(where: { e in depthFirstSearch.hasPathTo(e) == false })
            }
        }
        
        
        ////////////////////// 基于起点 0 进行测试 //////////////////////
        var source = 0
        var depthFirstSearch = directedGraph2.depthFirstSearcher(source: source)
        XCTAssertEqual(depthFirstSearch.connectedVertexes().sorted(), [0, 1, 2, 3, 4, 5])
        // 检测 source 到 source...5 的路径是否可以连通
        for target in source...5 {
            let path = depthFirstSearch.pathTo(target)
            // 断言为 false 表明测试通过
            XCTAssertFalse(isNotConnected(path: path))
        }
        
        ////////////////////// 基于起点 1 进行测试 //////////////////////
        source = 1
        depthFirstSearch = directedGraph2.depthFirstSearcher(source: source)
        XCTAssertEqual(depthFirstSearch.connectedVertexes().sorted(), [1, 2, 3, 4, 5])
        // 检测 source 到 source...5 的路径是否可以连通
        for target in source...5 {
            let path = depthFirstSearch.pathTo(target)
            // 断言为 false 表明测试通过
            XCTAssertFalse(isNotConnected(path: path))
        }
        // 起点 1 无法与 0 连通
        XCTAssertTrue(isNotConnected(path: depthFirstSearch.pathTo(0)))
        // hasPathTo 与 isNotConnected 的作用相同，但后者是为了检测 path 的构造做了许多检测工作
        XCTAssertFalse(depthFirstSearch.hasPathTo(0))
        
        ////////////////////// 基于起点 2 进行测试 //////////////////////
        source = 2
        depthFirstSearch = directedGraph2.depthFirstSearcher(source: source)
        XCTAssertEqual(depthFirstSearch.connectedVertexes().sorted(), [2, 3, 4, 5])
        // 检测 source 到 source...5 的路径是否可以连通
        for target in source...5 {
            let path = depthFirstSearch.pathTo(target)
            // 断言为 false 表明测试通过
            XCTAssertFalse(isNotConnected(path: path))
        }
        // 起点 2 无法与 0 连通
        XCTAssertTrue(isNotConnected(path: depthFirstSearch.pathTo(0)))
        // hasPathTo 与 isNotConnected 的作用相同，但后者是为了检测 path 的构造做了许多检测工作
        XCTAssertFalse(depthFirstSearch.hasPathTo(0))
        // 起点 2 无法与 1 连通
        XCTAssertTrue(isNotConnected(path: depthFirstSearch.pathTo(1)))
        // hasPathTo 与 isNotConnected 的作用相同，但后者是为了检测 path 的构造做了许多检测工作
        XCTAssertFalse(depthFirstSearch.hasPathTo(1))
        
        ////////////////////// 基于起点 3 进行测试 //////////////////////
        source = 3
        depthFirstSearch = directedGraph2.depthFirstSearcher(source: source)
        XCTAssertEqual(depthFirstSearch.connectedVertexes().sorted(), [3, 4, 5])
        // 检测 source 到 source...5 的路径是否可以连通
        for target in source...5 {
            let path = depthFirstSearch.pathTo(target)
            // 断言为 false 表明测试通过
            XCTAssertFalse(isNotConnected(path: path))
        }
        // 起点 3 无法与 0 连通
        XCTAssertTrue(isNotConnected(path: depthFirstSearch.pathTo(0)))
        // hasPathTo 与 isNotConnected 的作用相同，但后者是为了检测 path 的构造做了许多检测工作
        XCTAssertFalse(depthFirstSearch.hasPathTo(0))
        // 起点 3 无法与 1 连通
        XCTAssertTrue(isNotConnected(path: depthFirstSearch.pathTo(1)))
        // hasPathTo 与 isNotConnected 的作用相同，但后者是为了检测 path 的构造做了许多检测工作
        XCTAssertFalse(depthFirstSearch.hasPathTo(1))
        // 起点 3 无法与 2 连通
        XCTAssertTrue(isNotConnected(path: depthFirstSearch.pathTo(2)))
        // hasPathTo 与 isNotConnected 的作用相同，但后者是为了检测 path 的构造做了许多检测工作
        XCTAssertFalse(depthFirstSearch.hasPathTo(2))
        
        ////////////////////// 基于起点 4 进行测试 //////////////////////
        source = 4
        depthFirstSearch = directedGraph2.depthFirstSearcher(source: source)
        XCTAssertEqual(depthFirstSearch.connectedVertexes().sorted(), [4])
        // 起点 4 无法与 0 连通
        XCTAssertTrue(isNotConnected(path: depthFirstSearch.pathTo(0)))
        // hasPathTo 与 isNotConnected 的作用相同，但后者是为了检测 path 的构造做了许多检测工作
        XCTAssertFalse(depthFirstSearch.hasPathTo(0))
        // 起点 4 无法与 1 连通
        XCTAssertTrue(isNotConnected(path: depthFirstSearch.pathTo(1)))
        // hasPathTo 与 isNotConnected 的作用相同，但后者是为了检测 path 的构造做了许多检测工作
        XCTAssertFalse(depthFirstSearch.hasPathTo(1))
        // 起点 4 无法与 2 连通
        XCTAssertTrue(isNotConnected(path: depthFirstSearch.pathTo(2)))
        // hasPathTo 与 isNotConnected 的作用相同，但后者是为了检测 path 的构造做了许多检测工作
        XCTAssertFalse(depthFirstSearch.hasPathTo(2))
        // 起点 4 无法与 3 连通
        XCTAssertTrue(isNotConnected(path: depthFirstSearch.pathTo(3)))
        // hasPathTo 与 isNotConnected 的作用相同，但后者是为了检测 path 的构造做了许多检测工作
        XCTAssertFalse(depthFirstSearch.hasPathTo(3))
        // 起点 4 无法与 5 连通
        XCTAssertTrue(isNotConnected(path: depthFirstSearch.pathTo(5)))
        // hasPathTo 与 isNotConnected 的作用相同，但后者是为了检测 path 的构造做了许多检测工作
        XCTAssertFalse(depthFirstSearch.hasPathTo(5))
        
        ////////////////////// 基于起点 5 进行测试 //////////////////////
        source = 5
        depthFirstSearch = directedGraph2.depthFirstSearcher(source: source)
        XCTAssertEqual(depthFirstSearch.connectedVertexes().sorted(), [5])
        // 起点 5 无法与 0 连通
        XCTAssertTrue(isNotConnected(path: depthFirstSearch.pathTo(0)))
        // hasPathTo 与 isNotConnected 的作用相同，但后者是为了检测 path 的构造做了许多检测工作
        XCTAssertFalse(depthFirstSearch.hasPathTo(0))
        // 起点 5 无法与 1 连通
        XCTAssertTrue(isNotConnected(path: depthFirstSearch.pathTo(1)))
        // hasPathTo 与 isNotConnected 的作用相同，但后者是为了检测 path 的构造做了许多检测工作
        XCTAssertFalse(depthFirstSearch.hasPathTo(1))
        // 起点 5 无法与 2 连通
        XCTAssertTrue(isNotConnected(path: depthFirstSearch.pathTo(2)))
        // hasPathTo 与 isNotConnected 的作用相同，但后者是为了检测 path 的构造做了许多检测工作
        XCTAssertFalse(depthFirstSearch.hasPathTo(2))
        // 起点 5 无法与 3 连通
        XCTAssertTrue(isNotConnected(path: depthFirstSearch.pathTo(3)))
        // hasPathTo 与 isNotConnected 的作用相同，但后者是为了检测 path 的构造做了许多检测工作
        XCTAssertFalse(depthFirstSearch.hasPathTo(3))
        // 起点 5 无法与 4 连通
        XCTAssertTrue(isNotConnected(path: depthFirstSearch.pathTo(4)))
        // hasPathTo 与 isNotConnected 的作用相同，但后者是为了检测 path 的构造做了许多检测工作
        XCTAssertFalse(depthFirstSearch.hasPathTo(4))
    }
    
    func graph2BFSTest() {
        print("graph2BFSTest...")
        let bfs = directedGraph2.breadthFirstSearcher(source: 0)
        XCTAssert(bfs.pathTo(0) == [0])
        XCTAssert(bfs.pathTo(1) == [1, 0])
        XCTAssert(bfs.pathTo(2) == [2, 0])
        XCTAssert(bfs.pathTo(3) == [3, 5, 0])
        XCTAssert(bfs.pathTo(4) == [4, 2, 0])
        XCTAssert(bfs.pathTo(5) == [5, 0])
    }
    
    func graph3DFSTest() {
        let connectedVertexesCollection: [Int:Set<Int>] = [
            0:Set<Int>([0, 1, 2, 3, 4, 5, 6, 30]),
            1:Set<Int>([1]),
            2:Set<Int>([2]),
            3:Set<Int>([3]),
            4:Set<Int>([4, 3]),
            5:Set<Int>([5, 3, 4]),
            6:Set<Int>([6, 4, 3]),
            7:Set<Int>([7, 8, 30]),
            8:Set<Int>([8, 30]),
            9:Set<Int>([9, 10, 11, 12, 30]),
            10:Set<Int>([10]),
            11:Set<Int>([11, 12, 30]),
            12:Set<Int>([12, 30]),
            13:Set<Int>([13, 30]),
            14:Set<Int>([14, 13, 30, 15]),
            15:Set<Int>([15, 30]),
            16:Set<Int>([16, 30, 15, 17]),
            17:Set<Int>([17, 30]),
            18:Set<Int>([18, 30, 17, 25, 28]),
            19:Set<Int>([19, 30, 18, 25, 17, 28]),
            20:Set<Int>([20, 21, 13, 30]),
            21:Set<Int>([21]),
            22:Set<Int>([22, 21, 23]),
            23:Set<Int>([23]),
            24:Set<Int>([24, 20, 21, 22, 23, 28, 13, 30]),
            25:Set<Int>([25, 28]),
            26:Set<Int>([26, 28]),
            27:Set<Int>([27, 28]),
            28:Set<Int>([28]),
            29:Set<Int>([29, 30]),
            30:Set<Int>([30]),
            31:Set<Int>([31, 29, 30]),
            32:Set<Int>([32, 31, 33, 30, 29]),
            33:Set<Int>([33]),
            34:Set<Int>([34, 33, 35]),
            35:Set<Int>([35]),
            36:Set<Int>([36, 35, 29, 30])
        ]
        for s in 0...36 {
            let dfs = directedGraph3.depthFirstSearcher(source: s)
            // 从0至36这么多个数字中提取可以被s连通的顶点
            let markedVertexes = Set<Int>((0...36).filter { e in dfs.hasPathTo(e) })
            if let set = connectedVertexesCollection[s] {
                XCTAssertEqual(markedVertexes, set)
            }
        }
    }
    
    func graph3BFSTest() {
        let bfs = directedGraph3.breadthFirstSearcher(source: 0)
        XCTAssert(bfs.pathTo(0) == [0])
    }
    
    // 测试 graph3 所有顶点的度数
    func graph3DegreeTest() {
        XCTAssert(directedGraph3.degree(vertex: 0) == 5)
        XCTAssert(directedGraph3.degree(vertex: 1) == 1)
        XCTAssert(directedGraph3.degree(vertex: 2) == 1)
        XCTAssert(directedGraph3.degree(vertex: 3) == 2)
        XCTAssert(directedGraph3.degree(vertex: 4) == 3)
        XCTAssert(directedGraph3.degree(vertex: 5) == 3)
        XCTAssert(directedGraph3.degree(vertex: 6) == 2)
        XCTAssert(directedGraph3.degree(vertex: 7) == 1)
        XCTAssert(directedGraph3.degree(vertex: 8) == 2)
        XCTAssert(directedGraph3.degree(vertex: 9) == 3)
        XCTAssert(directedGraph3.degree(vertex: 10) == 1)
        XCTAssert(directedGraph3.degree(vertex: 11) == 3)
        XCTAssert(directedGraph3.degree(vertex: 12) == 3)
        XCTAssert(directedGraph3.degree(vertex: 13) == 3)
        XCTAssert(directedGraph3.degree(vertex: 14) == 3)
        XCTAssert(directedGraph3.degree(vertex: 15) == 3)
        XCTAssert(directedGraph3.degree(vertex: 16) == 3)
        XCTAssert(directedGraph3.degree(vertex: 17) == 3)
        XCTAssert(directedGraph3.degree(vertex: 18) == 4)
        XCTAssert(directedGraph3.degree(vertex: 19) == 3)
        XCTAssert(directedGraph3.degree(vertex: 20) == 3)
        XCTAssert(directedGraph3.degree(vertex: 21) == 3)
        XCTAssert(directedGraph3.degree(vertex: 22) == 3)
        XCTAssert(directedGraph3.degree(vertex: 23) == 2)
        XCTAssert(directedGraph3.degree(vertex: 24) == 5)
        XCTAssert(directedGraph3.degree(vertex: 25) == 3)
        XCTAssert(directedGraph3.degree(vertex: 26) == 1)
        XCTAssert(directedGraph3.degree(vertex: 27) == 1)
        XCTAssert(directedGraph3.degree(vertex: 28) == 4)
        XCTAssert(directedGraph3.degree(vertex: 29) == 3)
        XCTAssert(directedGraph3.degree(vertex: 30) == 13)
        XCTAssert(directedGraph3.degree(vertex: 31) == 3)
        XCTAssert(directedGraph3.degree(vertex: 32) == 2)
        XCTAssert(directedGraph3.degree(vertex: 33) == 2)
        XCTAssert(directedGraph3.degree(vertex: 34) == 2)
        XCTAssert(directedGraph3.degree(vertex: 35) == 2)
        XCTAssert(directedGraph3.degree(vertex: 36) == 2)
    }
    
    func graph4DFSTest() {
        XCTAssertEqual(directedGraph4.depthFirstSearcher(source: 0).connectedVertexes().sorted(),
                       (0...40).map( {e in e} ))
        
        // 打印出发点(0...40)与目标(0...40)的交叉连接产生的路径
        for v in 0...40 {
            let dfs = DepthFirstSearch(graph: directedGraph4, source: v)
            for item in 0...40 {
                let path = dfs.pathTo(item)
                print("\(v)-\(item) pathTo: \(path)")
            }
        }
    }
    
    func graph4BFSTest() {
        let bfs = directedGraph4.breadthFirstSearcher(source: 0)
        XCTAssert(bfs.pathTo(0) == [0])
    }
    
    // 检测 graph 的连通性
    func connectedGraphTest() {
        /*
         所有的有向图默认都是不连通的，让不连通的图变得连通的方法如下：
         使用 getNotConnectedAndConnectedVertexPairCollection 函数
         提取图不连通的所有顶点对（由 VertexPair 类型表示）组成的集合 Set<VertexPair>，
         遍历集合，将每个 VertexPair 的 source 和 target 反过来添加到 addEdge 函数，
         通过从 target 添加一条有向边连接到 source 使之连通。
         */
        // by dfs
        XCTAssertFalse(isConnectedGraph(graph: directedGraph1))
        XCTAssertFalse(isConnectedGraph(graph: directedGraph2))
        XCTAssertFalse(isConnectedGraph(graph: directedGraph3))
        XCTAssertFalse(isConnectedGraph(graph: directedGraph4))
        
        // 让 directedGraph1 连通
        
        // 让 directedGraph2 连通
        
        // 让 directedGraph3 连通
        let notConnectVertexPairOfDirectedGraph3 = getNotConnectedAndConnectedVertexPairCollection(graph: directedGraph3).notConnect
        for pair in notConnectVertexPairOfDirectedGraph3 {
            directedGraph3.addEdge(v: pair.target, w: pair.source)
        }
        XCTAssertTrue(isConnectedGraph(graph: directedGraph3))
        
        // 让 directedGraph4 连通
        let notConnectVertexPairOfDirectedGraph4 = getNotConnectedAndConnectedVertexPairCollection(graph: directedGraph4).notConnect
        for pair in notConnectVertexPairOfDirectedGraph4 {
            directedGraph4.addEdge(v: pair.target, w: pair.source)
        }
        XCTAssertTrue(isConnectedGraph(graph: directedGraph4))
        
        // by bfs
    }

    static var allTests = [
        ("checkAdjustOfGraph1", checkAdjustOfGraph1),
        ("checkAdjustOfGraph2", checkAdjustOfGraph2),
        ("checkAdjustOfGraph3", checkAdjustOfGraph3),
        ("graph2DFSTest", graph2DFSTest),
        ("graph3DFSTest", graph3DFSTest),
//        ("graph4DFSTest", graph4DFSTest),
        ("graph4BFSTest", graph4BFSTest),
//        ("graph3DegreeTest", graph3DegreeTest),
        ("connectedGraphTest", connectedGraphTest),
//        ("graph2BFSTest", graph2BFSTest),
//        ("graph3BFSTest", graph3BFSTest),
    ]
}
