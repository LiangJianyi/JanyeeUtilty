/**
 GraphTest.swift 用于创建一些公共的测试对象，
 以及对 graph 对象进行一些通用的测试
 */


import XCTest
import JanyeeUtilty
import Graph

public func makeDirectedGraph1() -> DirectedGraph {
    let directedGraph1 = DirectedGraph()
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
    let directedGraph2 = DirectedGraph()
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
    let directedGraph3 = DirectedGraph()
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
    let undirectedGraph1 = UndirectedGraph()
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
    let undirectedGraph2 = UndirectedGraph()
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
    let undirectedGraph3 = UndirectedGraph()
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

// 测试类主体
final class GraphTests: XCTestCase {
    var directedGraph1 = makeDirectedGraph1()
    var directedGraph2 = makeDirectedGraph2()
    var directedGraph3 = makeDirectedGraph3()
    var directedGraph4 = makeDirectedGraph4()


    var undirectedGraph1 = makeUndirectedGraph1()
    var undirectedGraph2 = makeUndirectedGraph2()
    var undirectedGraph3 = makeUndirectedGraph3()
    var undirectedGraph4 = makeUndirectedGraph4()

    // 相等性比较、Graph容器比较
    func graphEqualTo() {
        // 拷贝引用
        let graphRef: some Graphable = directedGraph1
        XCTAssertEqual(graphRef as! DirectedGraph, directedGraph1)
        graphRef.addEdge(v: 8, w: 7)
        graphRef.addEdge(v: 7, w: 12)
        XCTAssertEqual(graphRef as! DirectedGraph, directedGraph1)
        // 值拷贝
        let graphCopy = directedGraph1.clone()
        graphCopy.addEdge(v: 11, w: 8)
        XCTAssertFalse(graphCopy == directedGraph1)
        XCTAssertFalse(graphCopy == graphRef as! DirectedGraph)
        
        // 重置
        directedGraph1 = makeDirectedGraph1()
    }
    
    func notConnectedPathTest() {
        // dfs
        var pairs = DepthFirstSearch<DirectedGraph>.getNotConnectedAndConnectedVertexPairCollection(graph: directedGraph2)
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
        
        // bfs
        pairs = BreadthFirstSearch<DirectedGraph>.getNotConnectedAndConnectedVertexPairCollection(graph: directedGraph2)
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
    
    func addEdgesTest() {
        var g = directedGraph1.clone()
        XCTAssertEqual(g.vertex, 13)
        XCTAssertEqual(g.edges, 13)
        
        g.addEdge(v: 6, w: 7)
        XCTAssertEqual(g.vertex, 13)
        XCTAssertEqual(g.edges, 14)
        
        g.addEdge(v: 8, w: 7)
        XCTAssertEqual(g.vertex, 13)
        XCTAssertEqual(g.edges, 15)
        
        g.addEdge(v: 8, w: 9)
        XCTAssertEqual(g.vertex, 13)
        XCTAssertEqual(g.edges, 16)
        
        g.addEdge(v: 9, w: 13)
        XCTAssertEqual(g.vertex, 14)
        XCTAssertEqual(g.edges, 17)
        
        g.addEdge(v: 10, w: 0)
        XCTAssertEqual(g.vertex, 14)
        XCTAssertEqual(g.edges, 18)
        
        for i in 0...13 {
            if i != 12 {
                g.addEdge(v: 12, w: i)
            }
        }
        XCTAssertEqual(g.vertex, 14)
        XCTAssertEqual(g.edges, 31)
    }
    
    func testMain() {
        for test in Self.allTests {
            print("Test \(test.0) start...")
            test.1(self)()
        }
    }
    
    static var allTests = [
        ("graphEqualTo", graphEqualTo),
        ("notConnectedPathTest", notConnectedPathTest),
        ("addEdgesTest", addEdgesTest),
    ]
}
