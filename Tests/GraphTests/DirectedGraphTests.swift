import XCTest
import Graph

final class DirectedGraphTests: XCTestCase {
    var directedGraph1 = makeDirectedGraph1()
    var directedGraph2 = makeDirectedGraph2()
    var directedGraph3 = makeDirectedGraph3()
    var directedGraph4 = makeDirectedGraph4()
    var directedGraph5 = makeDirectedGraph5()
    
    func testAdjustOfGraph1() {
        XCTAssertTrue(directedGraph1.adjust[0].sorted() == [6, 2, 1, 5].sorted())
        XCTAssertFalse(directedGraph1.adjust[1] == [0])
        XCTAssertFalse(directedGraph1.adjust[2] == [0])
        XCTAssertFalse(directedGraph1.adjust[3].sorted() == [5, 4].sorted())
        XCTAssertFalse(directedGraph1.adjust[4].sorted() == [6, 3, 5].sorted())
        XCTAssertFalse(directedGraph1.adjust[5].sorted() == [3, 4, 0].sorted())
        XCTAssertFalse(directedGraph1.adjust[6].sorted() == [0, 4].sorted())
        XCTAssertTrue(directedGraph1.adjust[7] == [8])
        XCTAssertFalse(directedGraph1.adjust[8] == [7])
        XCTAssertTrue(directedGraph1.adjust[9].sorted() == [11, 10, 12].sorted())
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
    
    func testAdjustOfReverseGraph1() {
        let reverseDigraph1 = directedGraph1.reverse()
        XCTAssertTrue(reverseDigraph1.adjust[0] == [])
        XCTAssertTrue(reverseDigraph1.adjust[1] == [0])
        XCTAssertTrue(reverseDigraph1.adjust[2] == [0])
        XCTAssertTrue(reverseDigraph1.adjust[3].sorted() == [5, 4].sorted())
        XCTAssertTrue(reverseDigraph1.adjust[4].sorted() == [5, 6].sorted())
        XCTAssertTrue(reverseDigraph1.adjust[5] == [0])
        XCTAssertTrue(reverseDigraph1.adjust[6] == [0])
        XCTAssertTrue(reverseDigraph1.adjust[7] == [])
        XCTAssertTrue(reverseDigraph1.adjust[8] == [7])
        XCTAssertTrue(reverseDigraph1.adjust[9] == [])
        XCTAssertTrue(reverseDigraph1.adjust[10] == [9])
        XCTAssertTrue(reverseDigraph1.adjust[11] == [9])
        XCTAssertTrue(reverseDigraph1.adjust[12].sorted() == [9, 11].sorted())
    }
    
    func testAdjustOfGraph2() {
        XCTAssert(directedGraph2.adjust[0].sorted() == [5, 1, 2].sorted())
        XCTAssert(directedGraph2.adjust[1] == [2])
        XCTAssert(directedGraph2.adjust[2].sorted() == [4, 3].sorted())
        XCTAssert(directedGraph2.adjust[3].sorted() == [4, 5].sorted())
        XCTAssertFalse(directedGraph2.adjust[4].sorted() == [2, 3].sorted())
        XCTAssertTrue(directedGraph2.adjust[4] == [])
        XCTAssertFalse(directedGraph2.adjust[5].sorted() == [0, 3].sorted())
        XCTAssertTrue(directedGraph2.adjust[5] == [])
    }
    
    func testAdjustOfGraph3() {
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
    
    func testAdjustOfReverseGraph3() {
        let reverseDigraph3 = directedGraph3.reverse()
        XCTAssert(reverseDigraph3.adjust[0] == [])
        XCTAssert(reverseDigraph3.adjust[1] == [0])
        XCTAssert(reverseDigraph3.adjust[2] == [0])
        XCTAssert(reverseDigraph3.adjust[3] == [5, 4].sorted())
        XCTAssert(reverseDigraph3.adjust[4] == [5, 6].sorted())
        XCTAssert(reverseDigraph3.adjust[5] == [0])
        XCTAssert(reverseDigraph3.adjust[6] == [0])
        XCTAssert(reverseDigraph3.adjust[7] == [])
        XCTAssert(reverseDigraph3.adjust[8] == [7])
        XCTAssert(reverseDigraph3.adjust[9] == [])
        XCTAssert(reverseDigraph3.adjust[10] == [9])
        XCTAssert(reverseDigraph3.adjust[11] == [9])
        XCTAssert(reverseDigraph3.adjust[12].sorted() == [9, 11].sorted())
        XCTAssert(reverseDigraph3.adjust[13].sorted() == [14, 20].sorted())
        XCTAssert(reverseDigraph3.adjust[14] == [])
        XCTAssert(reverseDigraph3.adjust[15].sorted() == [14, 16].sorted())
        XCTAssert(reverseDigraph3.adjust[16] == [])
        XCTAssert(reverseDigraph3.adjust[17].sorted() == [16, 18].sorted())
        XCTAssert(reverseDigraph3.adjust[18] == [19])
        XCTAssert(reverseDigraph3.adjust[19] == [])
        XCTAssert(reverseDigraph3.adjust[20] == [24])
        XCTAssert(reverseDigraph3.adjust[21].sorted() == [20, 22, 24].sorted())
        XCTAssert(reverseDigraph3.adjust[22] == [24])
        XCTAssert(reverseDigraph3.adjust[23].sorted() == [24, 22].sorted())
        XCTAssert(reverseDigraph3.adjust[24] == [])
        XCTAssert(reverseDigraph3.adjust[25].sorted() == [18, 19].sorted())
        XCTAssert(reverseDigraph3.adjust[26] == [])
        XCTAssert(reverseDigraph3.adjust[27] == [])
        XCTAssert(reverseDigraph3.adjust[28].sorted() == [24, 26, 27, 25].sorted())
        XCTAssert(reverseDigraph3.adjust[29].sorted() == [31, 36].sorted())
        XCTAssert(reverseDigraph3.adjust[30].sorted() == [8, 0, 12, 13, 14, 15, 16, 17, 18, 19, 29, 31, 11].sorted())
        XCTAssert(reverseDigraph3.adjust[31] == [32])
        XCTAssert(reverseDigraph3.adjust[32] == [])
        XCTAssert(reverseDigraph3.adjust[33].sorted() == [34, 32].sorted())
        XCTAssert(reverseDigraph3.adjust[34] == [])
        XCTAssert(reverseDigraph3.adjust[35].sorted() == [36, 34].sorted())
        XCTAssert(reverseDigraph3.adjust[36] == [])
    }
    
    func testGraph2DFS() {
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
    
    func testGraph2BFS() {
        print("graph2BFSTest...")
        let bfs = directedGraph2.breadthFirstSearcher(source: 0)
        XCTAssert(bfs.pathTo(0) == [0])
        XCTAssert(bfs.pathTo(1) == [1, 0])
        XCTAssert(bfs.pathTo(2) == [2, 0])
        XCTAssert(bfs.pathTo(3) == [3, 2, 0])
        XCTAssert(bfs.pathTo(4) == [4, 2, 0])
        XCTAssert(bfs.pathTo(5) == [5, 0])
    }
    
    func testGraph3DFS() {
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
    
    func testGraph3BFS() {
        let bfs = directedGraph3.breadthFirstSearcher(source: 0)
        XCTAssert(bfs.pathTo(0) == [0])
    }
    
    // 测试 graph3 所有顶点的度数
    func testGraph3Degree() {
        for v in 0...36 {
            print("顶点 \(v) 度数：\(directedGraph3.degree(vertex: v))")
        }
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
    
    func testGraph4DFS() {
        XCTAssertEqual(directedGraph4.depthFirstSearcher(source: 0).connectedVertexes().sorted(),
                       [0, 2, 3, 4, 5, 17])
    }
    
    // 《算法》第四版 图4.2.2
    func testGraph5DFS() {
        let dfs = directedGraph5.depthFirstSearcher(source: 57)
        XCTAssertFalse(dfs.hasPathTo(8))
    }
    
    func testGraph4BFS() {
        let bfs = directedGraph4.breadthFirstSearcher(source: 0)
        XCTAssert(bfs.pathTo(0) == [0])
    }
    
    // 检测 graph 的连通性
    func testConnectedGraph() {
        // directedGraph5 是个特例，不能把它放进 dig 数组
        let dig = [directedGraph1, directedGraph2, directedGraph3, directedGraph4]
        /*
         所有的有向图默认都是不连通的，让不连通的图变得连通的方法如下：
         使用 getNotConnectedAndConnectedVertexPairCollection 函数
         提取图不连通的所有顶点对（由 VertexPair 类型表示）组成的集合 Set<VertexPair>，
         遍历集合，将每个 VertexPair 的 source 和 target 反过来添加到 addEdge 函数，
         通过从 target 添加一条有向边连接到 source 使之连通。
         */
        // by dfs
        XCTAssertFalse(DepthFirstSearch<DirectedGraph>.isConnectedGraph(graph: directedGraph1))
        XCTAssertFalse(DepthFirstSearch<DirectedGraph>.isConnectedGraph(graph: directedGraph2))
        XCTAssertFalse(DepthFirstSearch<DirectedGraph>.isConnectedGraph(graph: directedGraph3))
        XCTAssertFalse(DepthFirstSearch<DirectedGraph>.isConnectedGraph(graph: directedGraph4))
        XCTAssertFalse(DepthFirstSearch<DirectedGraph>.isConnectedGraph(graph: directedGraph5))
        
        // 让 directedGraph1, directedGraph2, directedGraph3, directedGraph4, directedGraph5 连通
        
        for graph in dig {
            graph.addEdge(v: 100, w: 101)
        }
        XCTAssertEqual(directedGraph1.vertex, 102)
        XCTAssertEqual(directedGraph2.vertex, 102)
        XCTAssertEqual(directedGraph3.vertex, 102)
        XCTAssertEqual(directedGraph4.vertex, 102)
        
        for graph in dig {
            // 提取所有未连通的顶点对集合，遍历集合把所有顶点对连线
            let notConnectVertexPairOfDirectedGraph = DepthFirstSearch<DirectedGraph>.getNotConnectedAndConnectedVertexPairCollection(graph: graph).notConnect
            for pair in notConnectVertexPairOfDirectedGraph {
                graph.addEdge(v: pair.target, w: pair.source)
            }
            XCTAssertTrue(DepthFirstSearch<DirectedGraph>.isConnectedGraph(graph: graph))
        }
        
        // 单独提取 directedGraph5 所有未连通的顶点对集合，遍历集合把所有顶点对连线
        var notConnectVertexPairOfDirectedGraph = DepthFirstSearch<DirectedGraph>.getNotConnectedAndConnectedVertexPairCollection(graph: directedGraph5).notConnect
        for pair in notConnectVertexPairOfDirectedGraph {
            directedGraph5.addEdge(v: pair.target, w: pair.source)
        }
        XCTAssertTrue(DepthFirstSearch<DirectedGraph>.isConnectedGraph(graph: directedGraph5))
        
        // Reset all directed graphs
        directedGraph1 = makeDirectedGraph1()
        directedGraph2 = makeDirectedGraph2()
        directedGraph3 = makeDirectedGraph3()
        directedGraph4 = makeDirectedGraph4()
        directedGraph5 = makeDirectedGraph5()
        
        // by bfs
        XCTAssertFalse(BreadthFirstSearch<DirectedGraph>.isConnectedGraph(graph: directedGraph1))
        XCTAssertFalse(BreadthFirstSearch<DirectedGraph>.isConnectedGraph(graph: directedGraph2))
        XCTAssertFalse(BreadthFirstSearch<DirectedGraph>.isConnectedGraph(graph: directedGraph3))
        XCTAssertFalse(BreadthFirstSearch<DirectedGraph>.isConnectedGraph(graph: directedGraph4))
        XCTAssertFalse(BreadthFirstSearch<DirectedGraph>.isConnectedGraph(graph: directedGraph5))
        
        for graph in dig {
            // 提取所有未连通的顶点对集合，遍历集合把所有顶点对连线
            let notConnectVertexPairOfDirectedGraph = BreadthFirstSearch<DirectedGraph>.getNotConnectedAndConnectedVertexPairCollection(graph: graph).notConnect
            for pair in notConnectVertexPairOfDirectedGraph {
                graph.addEdge(v: pair.target, w: pair.source)
            }
            XCTAssertTrue(BreadthFirstSearch<DirectedGraph>.isConnectedGraph(graph: graph))
        }
        
        // 单独提取 directedGraph5 所有未连通的顶点对集合，遍历集合把所有顶点对连线
        notConnectVertexPairOfDirectedGraph = BreadthFirstSearch<DirectedGraph>.getNotConnectedAndConnectedVertexPairCollection(graph: directedGraph5).notConnect
        for pair in notConnectVertexPairOfDirectedGraph {
            directedGraph5.addEdge(v: pair.target, w: pair.source)
        }
        XCTAssertTrue(BreadthFirstSearch<DirectedGraph>.isConnectedGraph(graph: directedGraph5))
    }
}
