/**
 GraphTest.swift 用于创建一些公共的测试对象，
 以及对 graph 对象进行一些通用的测试
 */


import XCTest
import JanyeeUtilty
import Graph

public func makeDirectedGraph1() -> DirectedGraph {
    let directedGraph1 = DirectedGraph(vertex: 13, edges: 13)
    directedGraph1.addEdge(v: 0, w: 5)
    directedGraph1.addEdge(v: 4, w: 3)
    directedGraph1.addEdge(v: 0, w: 1)
    directedGraph1.addEdge(v: 9, w: 12)
    directedGraph1.addEdge(v: 6, w: 4)
    directedGraph1.addEdge(v: 5, w: 4)
    directedGraph1.addEdge(v: 0, w: 2)
    directedGraph1.addEdge(v: 11, w: 12)
    directedGraph1.addEdge(v: 9, w: 10)
    directedGraph1.addEdge(v: 0, w: 6)
    directedGraph1.addEdge(v: 7, w: 8)
    directedGraph1.addEdge(v: 9, w: 11)
    directedGraph1.addEdge(v: 5, w: 3)
    return directedGraph1
}

public func makeDirectedGraph2() -> DirectedGraph {
    let directedGraph2 = DirectedGraph(vertex: 6, edges: 8)
    directedGraph2.addEdge(v: 0, w: 5)
    directedGraph2.addEdge(v: 2, w: 4)
    directedGraph2.addEdge(v: 2, w: 3)
    directedGraph2.addEdge(v: 1, w: 2)
    directedGraph2.addEdge(v: 0, w: 1)
    directedGraph2.addEdge(v: 3, w: 4)
    directedGraph2.addEdge(v: 3, w: 5)
    directedGraph2.addEdge(v: 0, w: 2)
    return directedGraph2
}

public func makeDirectedGraph3() -> DirectedGraph {
    let directedGraph3 = DirectedGraph(vertex: 37, edges: 44)
    directedGraph3.addEdge(v: 0, w: 5)
    directedGraph3.addEdge(v: 4, w: 3)
    directedGraph3.addEdge(v: 0, w: 1)
    directedGraph3.addEdge(v: 9, w: 12)
    directedGraph3.addEdge(v: 6, w: 4)
    directedGraph3.addEdge(v: 5, w: 4)
    directedGraph3.addEdge(v: 0, w: 2)
    directedGraph3.addEdge(v: 11, w: 12)
    directedGraph3.addEdge(v: 9, w: 10)
    directedGraph3.addEdge(v: 0, w: 6)
    directedGraph3.addEdge(v: 7, w: 8)
    directedGraph3.addEdge(v: 9, w: 11)
    directedGraph3.addEdge(v: 5, w: 3)
    directedGraph3.addEdge(v: 0, w: 30)
    directedGraph3.addEdge(v: 8, w: 30)
    directedGraph3.addEdge(v: 11, w: 30)
    directedGraph3.addEdge(v: 12, w: 30)
    directedGraph3.addEdge(v: 13, w: 30)
    directedGraph3.addEdge(v: 14, w: 30)
    directedGraph3.addEdge(v: 15, w: 30)
    directedGraph3.addEdge(v: 16, w: 30)
    directedGraph3.addEdge(v: 17, w: 30)
    directedGraph3.addEdge(v: 18, w: 30)
    directedGraph3.addEdge(v: 19, w: 30)
    directedGraph3.addEdge(v: 29, w: 30)
    directedGraph3.addEdge(v: 31, w: 30)
    directedGraph3.addEdge(v: 31, w: 29)
    directedGraph3.addEdge(v: 36, w: 29)
    directedGraph3.addEdge(v: 36, w: 35)
    directedGraph3.addEdge(v: 34, w: 35)
    directedGraph3.addEdge(v: 34, w: 33)
    directedGraph3.addEdge(v: 32, w: 33)
    directedGraph3.addEdge(v: 32, w: 31)
    directedGraph3.addEdge(v: 19, w: 18)
    directedGraph3.addEdge(v: 19, w: 25)
    directedGraph3.addEdge(v: 18, w: 25)
    directedGraph3.addEdge(v: 18, w: 17)
    directedGraph3.addEdge(v: 16, w: 17)
    directedGraph3.addEdge(v: 16, w: 15)
    directedGraph3.addEdge(v: 14, w: 15)
    directedGraph3.addEdge(v: 14, w: 13)
    directedGraph3.addEdge(v: 20, w: 13)
    directedGraph3.addEdge(v: 20, w: 21)
    directedGraph3.addEdge(v: 22, w: 21)
    directedGraph3.addEdge(v: 22, w: 23)
    directedGraph3.addEdge(v: 24, w: 20)
    directedGraph3.addEdge(v: 24, w: 21)
    directedGraph3.addEdge(v: 24, w: 22)
    directedGraph3.addEdge(v: 24, w: 23)
    directedGraph3.addEdge(v: 24, w: 28)
    directedGraph3.addEdge(v: 27, w: 28)
    directedGraph3.addEdge(v: 26, w: 28)
    directedGraph3.addEdge(v: 25, w: 28)
    return directedGraph3
}

public func makeDirectedGraph4() -> DirectedGraph {
    // 将 GraphTest1.txt 的文本 parse 为 Graph 对象
    let directedGraph4: DirectedGraph
    // init graph4
    do {
        directedGraph4 = try DirectedGraph(readText: JanyeeUtilty.readTextToFile(filename: "GraphTest1.txt"))
    } catch is GraphError {
        fatalError("Throwing a GraphError.")
    } catch {
        fatalError("Unkown error.")
    }
    return directedGraph4
}

public func makeUndirectedGraph1() -> UndirectedGraph {
    let undirectedGraph1 = UndirectedGraph(vertex: 13, edges: 13)
    undirectedGraph1.addEdge(v: 0, w: 5)
    undirectedGraph1.addEdge(v: 4, w: 3)
    undirectedGraph1.addEdge(v: 0, w: 1)
    undirectedGraph1.addEdge(v: 9, w: 12)
    undirectedGraph1.addEdge(v: 6, w: 4)
    undirectedGraph1.addEdge(v: 5, w: 4)
    undirectedGraph1.addEdge(v: 0, w: 2)
    undirectedGraph1.addEdge(v: 11, w: 12)
    undirectedGraph1.addEdge(v: 9, w: 10)
    undirectedGraph1.addEdge(v: 0, w: 6)
    undirectedGraph1.addEdge(v: 7, w: 8)
    undirectedGraph1.addEdge(v: 9, w: 11)
    undirectedGraph1.addEdge(v: 5, w: 3)
    return undirectedGraph1
}

public func makeUndirectedGraph2() -> UndirectedGraph {
    let undirectedGraph2 = UndirectedGraph(vertex: 6, edges: 8)
    undirectedGraph2.addEdge(v: 0, w: 5)
    undirectedGraph2.addEdge(v: 2, w: 4)
    undirectedGraph2.addEdge(v: 2, w: 3)
    undirectedGraph2.addEdge(v: 1, w: 2)
    undirectedGraph2.addEdge(v: 0, w: 1)
    undirectedGraph2.addEdge(v: 3, w: 4)
    undirectedGraph2.addEdge(v: 3, w: 5)
    undirectedGraph2.addEdge(v: 0, w: 2)
    return undirectedGraph2
}

public func makeUndirectedGraph3() -> UndirectedGraph {
    let undirectedGraph3 = UndirectedGraph(vertex: 37, edges: 44)
    undirectedGraph3.addEdge(v: 0, w: 5)
    undirectedGraph3.addEdge(v: 4, w: 3)
    undirectedGraph3.addEdge(v: 0, w: 1)
    undirectedGraph3.addEdge(v: 9, w: 12)
    undirectedGraph3.addEdge(v: 6, w: 4)
    undirectedGraph3.addEdge(v: 5, w: 4)
    undirectedGraph3.addEdge(v: 0, w: 2)
    undirectedGraph3.addEdge(v: 11, w: 12)
    undirectedGraph3.addEdge(v: 9, w: 10)
    undirectedGraph3.addEdge(v: 0, w: 6)
    undirectedGraph3.addEdge(v: 7, w: 8)
    undirectedGraph3.addEdge(v: 9, w: 11)
    undirectedGraph3.addEdge(v: 5, w: 3)
    undirectedGraph3.addEdge(v: 0, w: 30)
    undirectedGraph3.addEdge(v: 8, w: 30)
    undirectedGraph3.addEdge(v: 11, w: 30)
    undirectedGraph3.addEdge(v: 12, w: 30)
    undirectedGraph3.addEdge(v: 13, w: 30)
    undirectedGraph3.addEdge(v: 14, w: 30)
    undirectedGraph3.addEdge(v: 15, w: 30)
    undirectedGraph3.addEdge(v: 16, w: 30)
    undirectedGraph3.addEdge(v: 17, w: 30)
    undirectedGraph3.addEdge(v: 18, w: 30)
    undirectedGraph3.addEdge(v: 19, w: 30)
    undirectedGraph3.addEdge(v: 29, w: 30)
    undirectedGraph3.addEdge(v: 31, w: 30)
    undirectedGraph3.addEdge(v: 31, w: 29)
    undirectedGraph3.addEdge(v: 36, w: 29)
    undirectedGraph3.addEdge(v: 36, w: 35)
    undirectedGraph3.addEdge(v: 34, w: 35)
    undirectedGraph3.addEdge(v: 34, w: 33)
    undirectedGraph3.addEdge(v: 32, w: 33)
    undirectedGraph3.addEdge(v: 32, w: 31)
    undirectedGraph3.addEdge(v: 19, w: 18)
    undirectedGraph3.addEdge(v: 19, w: 25)
    undirectedGraph3.addEdge(v: 18, w: 25)
    undirectedGraph3.addEdge(v: 18, w: 17)
    undirectedGraph3.addEdge(v: 16, w: 17)
    undirectedGraph3.addEdge(v: 16, w: 15)
    undirectedGraph3.addEdge(v: 14, w: 15)
    undirectedGraph3.addEdge(v: 14, w: 13)
    undirectedGraph3.addEdge(v: 20, w: 13)
    undirectedGraph3.addEdge(v: 20, w: 21)
    undirectedGraph3.addEdge(v: 22, w: 21)
    undirectedGraph3.addEdge(v: 22, w: 23)
    undirectedGraph3.addEdge(v: 24, w: 20)
    undirectedGraph3.addEdge(v: 24, w: 21)
    undirectedGraph3.addEdge(v: 24, w: 22)
    undirectedGraph3.addEdge(v: 24, w: 23)
    undirectedGraph3.addEdge(v: 24, w: 28)
    undirectedGraph3.addEdge(v: 27, w: 28)
    undirectedGraph3.addEdge(v: 26, w: 28)
    undirectedGraph3.addEdge(v: 25, w: 28)
    return undirectedGraph3
}

public func makeUndirectedGraph4() -> UndirectedGraph {
    // 将 GraphTest1.txt 的文本 parse 为 Graph 对象
    let undirectedGraph4: UndirectedGraph
    // init undirectedGraph4
    do {
        undirectedGraph4 = try UndirectedGraph(readText: JanyeeUtilty.readTextToFile(filename: "GraphTest1.txt"))
    } catch is GraphError {
        fatalError("Throwing a GraphError.")
    } catch {
        fatalError("Unkown error.")
    }
    return undirectedGraph4
}

let directedGraph1 = makeDirectedGraph1()
let directedGraph2 = makeDirectedGraph2()
let directedGraph3 = makeDirectedGraph3()
let directedGraph4 = makeDirectedGraph4()


let undirectedGraph1 = makeUndirectedGraph1()
let undirectedGraph2 = makeUndirectedGraph2()
let undirectedGraph3 = makeUndirectedGraph3()
let undirectedGraph4 = makeUndirectedGraph4()

/*
 可以考虑作为 GraphSearch 的扩展方法，
 并同时支持 dfs 和 bfs 的搜索
 */

struct VertexPair: Hashable, Equatable {
    private var s: Int
    private var t: Int
    
    public var source: Int {
        get {
            return self.s
        }
    }
    public var target: Int {
        get {
            return self.t
        }
    }
    
    init(source: Int, target: Int) {
        self.s = source
        self.t = target
    }
    
    public static func == (l: VertexPair, r: VertexPair) -> Bool {
        return l.s == r.s && l.t == r.t
    }
}

// 判断Graph是否连通
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
// 返回Graph不可连通的顶点对集合对与可连通的顶点对集合
func getNotConnectedAndConnectedVertexPairCollection<G: Graphable>(graph: G) -> (notConnect: Set<VertexPair>, isConnect: Set<VertexPair>) {
    var pairs = (notConnect: Set<VertexPair>(), isConnect: Set<VertexPair>())
    for s in 0..<graph.adjust.count {
        let dfs = graph.depthFirstSearcher(source: s)
        for t in 0..<graph.adjust.count {
            if dfs.hasPathTo(t) == false {
                pairs.notConnect.insert(VertexPair(source: s, target: t))
            } else {
                pairs.isConnect.insert(VertexPair(source: s, target: t))
            }
        }
    }
    return pairs
}

// 测试类主体
class GraphTests {
    // 相等性比较、Graph容器比较
    func graphEqualTo() {
        // 拷贝引用
        var graphRef: some Graphable = directedGraph1
        XCTAssertEqual(graphRef as! DirectedGraph, directedGraph1)
        graphRef.addEdge(v: 8, w: 7)
        graphRef.addEdge(v: 7, w: 12)
        XCTAssertEqual(graphRef as! DirectedGraph, directedGraph1)
        // 值拷贝
        let graphCopy = directedGraph1.clone()
        graphCopy.addEdge(v: 11, w: 8)
        XCTAssertFalse(graphCopy == directedGraph1)
        XCTAssertFalse(graphCopy == graphRef as! DirectedGraph)
    }
    
    func notConnectedPathTest() {
        let pairs = getNotConnectedAndConnectedVertexPairCollection(graph: directedGraph2)
        XCTAssertTrue(pairs.notConnect.contains(VertexPair(source: 1, target: 0)))
        XCTAssertTrue(pairs.notConnect.contains(VertexPair(source: 2, target: 0)))
        XCTAssertTrue(pairs.notConnect.contains(VertexPair(source: 2, target: 1)))
        XCTAssertTrue(pairs.notConnect.contains(VertexPair(source: 3, target: 0)))
        XCTAssertTrue(pairs.notConnect.contains(VertexPair(source: 3, target: 1)))
        XCTAssertTrue(pairs.notConnect.contains(VertexPair(source: 3, target: 2)))
        XCTAssertTrue(pairs.notConnect.contains(VertexPair(source: 4, target: 0)))
        XCTAssertTrue(pairs.notConnect.contains(VertexPair(source: 4, target: 1)))
        XCTAssertTrue(pairs.notConnect.contains(VertexPair(source: 4, target: 2)))
        XCTAssertTrue(pairs.notConnect.contains(VertexPair(source: 4, target: 3)))
        XCTAssertTrue(pairs.notConnect.contains(VertexPair(source: 4, target: 5)))
        XCTAssertTrue(pairs.notConnect.contains(VertexPair(source: 5, target: 0)))
        XCTAssertTrue(pairs.notConnect.contains(VertexPair(source: 5, target: 1)))
        XCTAssertTrue(pairs.notConnect.contains(VertexPair(source: 5, target: 2)))
        XCTAssertTrue(pairs.notConnect.contains(VertexPair(source: 5, target: 3)))
        XCTAssertTrue(pairs.notConnect.contains(VertexPair(source: 5, target: 4)))
        
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 0, target: 0)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 0, target: 1)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 0, target: 2)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 0, target: 3)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 0, target: 4)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 0, target: 5)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 1, target: 2)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 1, target: 3)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 1, target: 4)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 1, target: 5)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 1, target: 1)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 2, target: 2)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 2, target: 3)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 2, target: 4)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 2, target: 5)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 3, target: 3)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 3, target: 4)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 3, target: 5)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 4, target: 4)))
        XCTAssertTrue(pairs.isConnect.contains(VertexPair(source: 5, target: 5)))
    }
    
    deinit {
//        directedGraph1 = makeDirectedGraph1()
//        directedGraph2 = makeDirectedGraph2()
//        directedGraph3 = makeDirectedGraph3()
//        directedGraph4 = makeDirectedGraph4()
//
//        undirectedGraph1 = makeUndirectedGraph1()
//        undirectedGraph2 = makeUndirectedGraph2()
//        undirectedGraph3 = makeUndirectedGraph3()
//        undirectedGraph4 = makeUndirectedGraph4()
    }
    
    static var allTests = [
        ("graphEqualTo", graphEqualTo),
        ("notConnectedPathTest", notConnectedPathTest),
    ]
}
