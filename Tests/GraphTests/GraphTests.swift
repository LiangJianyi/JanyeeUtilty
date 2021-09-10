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

// 《算法》第四版 图4.2.2 的实现
public func makeDirectedGraph5() -> DirectedGraph {
    let directedGraph5 = DirectedGraph()
    directedGraph5.addEdge(v: 1, w: 2)
    directedGraph5.addEdge(v: 2, w: 3)
    directedGraph5.addEdge(v: 4, w: 3)
    directedGraph5.addEdge(v: 5, w: 4)
    directedGraph5.addEdge(v: 6, w: 5)
    directedGraph5.addEdge(v: 7, w: 6)
    directedGraph5.addEdge(v: 7, w: 8)
    directedGraph5.addEdge(v: 9, w: 10)
    directedGraph5.addEdge(v: 11, w: 10)
    directedGraph5.addEdge(v: 11, w: 12)
    directedGraph5.addEdge(v: 12, w: 13)
    directedGraph5.addEdge(v: 14, w: 13)
    directedGraph5.addEdge(v: 15, w: 14)
    directedGraph5.addEdge(v: 15, w: 16)
    directedGraph5.addEdge(v: 9, w: 1)
    directedGraph5.addEdge(v: 2, w: 10)
    directedGraph5.addEdge(v: 3, w: 11)
    directedGraph5.addEdge(v: 4, w: 12)
    directedGraph5.addEdge(v: 13, w: 5)
    directedGraph5.addEdge(v: 6, w: 14)
    directedGraph5.addEdge(v: 7, w: 15)
    directedGraph5.addEdge(v: 8, w: 16)
    directedGraph5.addEdge(v: 9, w: 17)
    directedGraph5.addEdge(v: 10, w: 18)
    directedGraph5.addEdge(v: 19, w: 11)
    directedGraph5.addEdge(v: 20, w: 12)
    directedGraph5.addEdge(v: 21, w: 13)
    directedGraph5.addEdge(v: 22, w: 14)
    directedGraph5.addEdge(v: 23, w: 15)
    directedGraph5.addEdge(v: 16, w: 24)
    directedGraph5.addEdge(v: 17, w: 18)
    directedGraph5.addEdge(v: 19, w: 18)
    directedGraph5.addEdge(v: 19, w: 20)
    directedGraph5.addEdge(v: 21, w: 20)
    directedGraph5.addEdge(v: 22, w: 21)
    directedGraph5.addEdge(v: 23, w: 22)
    directedGraph5.addEdge(v: 23, w: 24)
    directedGraph5.addEdge(v: 26, w: 25)
    directedGraph5.addEdge(v: 27, w: 26)
    directedGraph5.addEdge(v: 27, w: 28)
    directedGraph5.addEdge(v: 28, w: 29)
    directedGraph5.addEdge(v: 29, w: 30)
    directedGraph5.addEdge(v: 30, w: 31)
    directedGraph5.addEdge(v: 31, w: 32)
    directedGraph5.addEdge(v: 17, w: 25)
    directedGraph5.addEdge(v: 26, w: 18)
    directedGraph5.addEdge(v: 19, w: 27)
    directedGraph5.addEdge(v: 28, w: 20)
    directedGraph5.addEdge(v: 29, w: 21)
    directedGraph5.addEdge(v: 22, w: 30)
    directedGraph5.addEdge(v: 31, w: 23)
    directedGraph5.addEdge(v: 24, w: 32)
    directedGraph5.addEdge(v: 33, w: 34)
    directedGraph5.addEdge(v: 35, w: 34)
    directedGraph5.addEdge(v: 36, w: 35)
    directedGraph5.addEdge(v: 37, w: 36)
    directedGraph5.addEdge(v: 37, w: 38)
    directedGraph5.addEdge(v: 39, w: 38)
    directedGraph5.addEdge(v: 39, w: 40)
    directedGraph5.addEdge(v: 33, w: 25)
    directedGraph5.addEdge(v: 26, w: 34)
    directedGraph5.addEdge(v: 35, w: 27)
    directedGraph5.addEdge(v: 36, w: 28)
    directedGraph5.addEdge(v: 37, w: 29)
    directedGraph5.addEdge(v: 30, w: 38)
    directedGraph5.addEdge(v: 31, w: 39)
    directedGraph5.addEdge(v: 32, w: 40)
    directedGraph5.addEdge(v: 42, w: 41)
    directedGraph5.addEdge(v: 42, w: 43)
    directedGraph5.addEdge(v: 43, w: 44)
    directedGraph5.addEdge(v: 45, w: 44)
    directedGraph5.addEdge(v: 45, w: 46)
    directedGraph5.addEdge(v: 46, w: 47)
    directedGraph5.addEdge(v: 47, w: 48)
    directedGraph5.addEdge(v: 33, w: 41)
    directedGraph5.addEdge(v: 34, w: 42)
    directedGraph5.addEdge(v: 35, w: 43)
    directedGraph5.addEdge(v: 44, w: 36)
    directedGraph5.addEdge(v: 45, w: 37)
    directedGraph5.addEdge(v: 46, w: 38)
    directedGraph5.addEdge(v: 47, w: 39)
    directedGraph5.addEdge(v: 40, w: 48)
    directedGraph5.addEdge(v: 49, w: 50)
    directedGraph5.addEdge(v: 50, w: 51)
    directedGraph5.addEdge(v: 52, w: 51)
    directedGraph5.addEdge(v: 52, w: 53)
    directedGraph5.addEdge(v: 53, w: 54)
    directedGraph5.addEdge(v: 55, w: 54)
    directedGraph5.addEdge(v: 56, w: 55)
    directedGraph5.addEdge(v: 41, w: 49)
    directedGraph5.addEdge(v: 42, w: 50)
    directedGraph5.addEdge(v: 51, w: 43)
    directedGraph5.addEdge(v: 52, w: 44)
    directedGraph5.addEdge(v: 53, w: 45)
    directedGraph5.addEdge(v: 46, w: 54)
    directedGraph5.addEdge(v: 55, w: 47)
    directedGraph5.addEdge(v: 48, w: 56)
    directedGraph5.addEdge(v: 57, w: 58)
    directedGraph5.addEdge(v: 58, w: 59)
    directedGraph5.addEdge(v: 60, w: 59)
    directedGraph5.addEdge(v: 60, w: 61)
    directedGraph5.addEdge(v: 62, w: 61)
    directedGraph5.addEdge(v: 62, w: 63)
    directedGraph5.addEdge(v: 64, w: 63)
    directedGraph5.addEdge(v: 57, w: 49)
    directedGraph5.addEdge(v: 50, w: 58)
    directedGraph5.addEdge(v: 51, w: 59)
    directedGraph5.addEdge(v: 60, w: 52)
    directedGraph5.addEdge(v: 61, w: 53)
    directedGraph5.addEdge(v: 62, w: 54)
    directedGraph5.addEdge(v: 63, w: 55)
    directedGraph5.addEdge(v: 56, w: 64)
    return directedGraph5
}

public func makeDirectedGraph6() -> DirectedGraph {
    // 《算法》第四版 union-find 算法 图 1.5.2 中等规模的连通性问题举例
    let mediumUF: DirectedGraph
    do {
        mediumUF = try DirectedGraph(readText: JanyeeUtilty.readTextToFile(filename: "mediumUF.txt"))
    } catch is GraphError {
        fatalError("Throwing a GraphError.")
    } catch {
        fatalError("Unkown error.")
    }
    return mediumUF
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

public func makeUndirectedGraph5() -> UndirectedGraph {
    // 《算法》第四版 union-find 算法 图 1.5.2 中等规模的连通性问题举例
    let mediumUF: UndirectedGraph
    do {
        mediumUF = try UndirectedGraph(readText: JanyeeUtilty.readTextToFile(filename: "mediumUF.txt"))
    } catch is GraphError {
        fatalError("Throwing a GraphError.")
    } catch {
        fatalError("Unkown error.")
    }
    return mediumUF
}

public func makeUndirectedGraph6() -> UndirectedGraph {
    // 《算法》第四版 union-find 算法 图 1.5.2 中等规模的连通性问题举例
    let largeUF: UndirectedGraph
    do {
        largeUF = try UndirectedGraph(readText: JanyeeUtilty.readTextToFile(filename: "largeUF.txt"))
    } catch is GraphError {
        fatalError("Throwing a GraphError.")
    } catch {
        fatalError("Unkown error.")
    }
    return largeUF
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
    func testGraphEqualTo() {
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
    
    func testNotConnectedPathTest() {
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
    
    func testAddEdgesTest() {
        let g = directedGraph1.clone()
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
    
    func testAddEdges2Test() {
        let dg5 = DirectedGraph()
        XCTAssertEqual(dg5.vertex, 0)
        XCTAssertEqual(dg5.edges, 0)
        
        dg5.addEdge(v: 1, w: 2)
        XCTAssertEqual(dg5.vertex, 3)   // 隐含了顶点 0
        XCTAssertEqual(dg5.edges, 1)
        
        dg5.addEdge(v: 2, w: 3)
        XCTAssertEqual(dg5.vertex, 4)
        XCTAssertEqual(dg5.edges, 2)
        
        dg5.addEdge(v: 3, w: 4)
        XCTAssertEqual(dg5.vertex, 5)
        XCTAssertEqual(dg5.edges, 3)
        
        dg5.addEdge(v: 4, w: 5)
        XCTAssertEqual(dg5.vertex, 6)
        XCTAssertEqual(dg5.edges, 4)
        
        dg5.addEdge(v: 5, w: 6)
        XCTAssertEqual(dg5.vertex, 7)
        XCTAssertEqual(dg5.edges, 5)
        
        dg5.addEdge(v: 6, w: 7)
        XCTAssertEqual(dg5.vertex, 8)
        XCTAssertEqual(dg5.edges, 6)
        
        dg5.addEdge(v: 7, w: 8)
        XCTAssertEqual(dg5.vertex, 9)
        XCTAssertEqual(dg5.edges, 7)
        
        dg5.addEdge(v: 8, w: 9)
        XCTAssertEqual(dg5.vertex, 10)
        XCTAssertEqual(dg5.edges, 8)
        
        dg5.addEdge(v: 18, w: 1)
        XCTAssertEqual(dg5.vertex, 19)
        XCTAssertEqual(dg5.edges, 9)
        
        dg5.addEdge(v: 18, w: 17)
        XCTAssertEqual(dg5.vertex, 19)
        XCTAssertEqual(dg5.edges, 10)
        
        dg5.addEdge(v: 17, w: 16)
        XCTAssertEqual(dg5.vertex, 19)
        XCTAssertEqual(dg5.edges, 11)
        
        dg5.addEdge(v: 16, w: 15)
        XCTAssertEqual(dg5.vertex, 19)
        XCTAssertEqual(dg5.edges, 12)
        
        dg5.addEdge(v: 15, w: 14)
        XCTAssertEqual(dg5.vertex, 19)
        XCTAssertEqual(dg5.edges, 13)
        
        dg5.addEdge(v: 14, w: 13)
        XCTAssertEqual(dg5.vertex, 19)
        XCTAssertEqual(dg5.edges, 14)
        
        dg5.addEdge(v: 13, w: 12)
        XCTAssertEqual(dg5.vertex, 19)
        XCTAssertEqual(dg5.edges, 15)
        
        dg5.addEdge(v: 12, w: 11)
        XCTAssertEqual(dg5.vertex, 19)
        XCTAssertEqual(dg5.edges, 16)
        
        dg5.addEdge(v: 11, w: 10)
        XCTAssertEqual(dg5.vertex, 19)
        XCTAssertEqual(dg5.edges, 17)
        
        dg5.addEdge(v: 10, w: 9)
        XCTAssertEqual(dg5.vertex, 19)
        XCTAssertEqual(dg5.edges, 18)
        
        dg5.addEdge(v: 18, w: 0)
        XCTAssertEqual(dg5.vertex, 19)
        XCTAssertEqual(dg5.edges, 19)
        
        dg5.addEdge(v: 0, w: 16)
        XCTAssertEqual(dg5.vertex, 19)
        XCTAssertEqual(dg5.edges, 20)
        
        dg5.addEdge(v: 0, w: 19)
        XCTAssertEqual(dg5.vertex, 20)
        XCTAssertEqual(dg5.edges, 21)
        
        dg5.addEdge(v: 0, w: 20)
        XCTAssertEqual(dg5.vertex, 21)
        XCTAssertEqual(dg5.edges, 22)
        
        dg5.addEdge(v: 0, w: 21)
        XCTAssertEqual(dg5.vertex, 22)
        XCTAssertEqual(dg5.edges, 23)
        
        dg5.addEdge(v: 21, w: 24)
        XCTAssertEqual(dg5.vertex, 25)
        XCTAssertEqual(dg5.edges, 24)
        
        dg5.addEdge(v: 24, w: 23)
        XCTAssertEqual(dg5.vertex, 25)
        XCTAssertEqual(dg5.edges, 25)
        
        dg5.addEdge(v: 23, w: 22)
        XCTAssertEqual(dg5.vertex, 25)
        XCTAssertEqual(dg5.edges, 26)
        
        dg5.addEdge(v: 22, w: 15)
        XCTAssertEqual(dg5.vertex, 25)
        XCTAssertEqual(dg5.edges, 27)
        
        dg5.addEdge(v: 26, w: 14)
        XCTAssertEqual(dg5.vertex, 27)
        XCTAssertEqual(dg5.edges, 28)
        
        dg5.addEdge(v: 26, w: 25)
        XCTAssertEqual(dg5.vertex, 27)
        XCTAssertEqual(dg5.edges, 29)
        
        dg5.addEdge(v: 25, w: 24)
        XCTAssertEqual(dg5.vertex, 27)
        XCTAssertEqual(dg5.edges, 30)
        
        dg5.addEdge(v: 25, w: 27)
        XCTAssertEqual(dg5.vertex, 28)
        XCTAssertEqual(dg5.edges, 31)
        
        dg5.addEdge(v: 25, w: 28)
        XCTAssertEqual(dg5.vertex, 29)
        XCTAssertEqual(dg5.edges, 32)
        
        dg5.addEdge(v: 25, w: 13)
        XCTAssertEqual(dg5.vertex, 29)
        XCTAssertEqual(dg5.edges, 33)
        
        dg5.addEdge(v: 25, w: 11)
        XCTAssertEqual(dg5.vertex, 29)
        XCTAssertEqual(dg5.edges, 34)
        
        dg5.addEdge(v: 27, w: 10)
        XCTAssertEqual(dg5.vertex, 29)
        XCTAssertEqual(dg5.edges, 35)
        
        dg5.addEdge(v: 28, w: 24)
        XCTAssertEqual(dg5.vertex, 29)
        XCTAssertEqual(dg5.edges, 36)
        
        dg5.addEdge(v: 28, w: 24)
        XCTAssertEqual(dg5.vertex, 29)
        XCTAssertEqual(dg5.edges, 37)
        
        dg5.addEdge(v: 28, w: 24)
        XCTAssertEqual(dg5.vertex, 29)
        XCTAssertEqual(dg5.edges, 38)
        
        dg5.addEdge(v: 28, w: 24)
        XCTAssertEqual(dg5.vertex, 29)
        XCTAssertEqual(dg5.edges, 39)
        
        dg5.addEdge(v: 28, w: 24)
        XCTAssertEqual(dg5.vertex, 29)
        XCTAssertEqual(dg5.edges, 40)
        
        dg5.addEdge(v: 21, w: 28)
        XCTAssertEqual(dg5.vertex, 29)
        XCTAssertEqual(dg5.edges, 41)
    }
    
    func testEqualityOnCollection() {
        func randomDirectorGraphGenerator(vertexCount: UInt16) -> DirectedGraph {
            let dg = DirectedGraph()
            // 在不确定的循环次数中随机挑选一个顶点 s，
            // 从 s 出发随机连接其它的顶点。
            // 随机连接的次数为 M。
            let N = (1...1000).randomElement()!
            let M = (1...1000).randomElement()!
            for _ in 1...N {
                let s: Int = Int((0..<vertexCount).randomElement()!)
                for _ in 1...M {
                    dg.addEdge(v: s, w: Int((0..<vertexCount).randomElement()!))
                }
            }
            return dg
        }
        
        // 生成 3 个随机有向图
        let dgs = [
            randomDirectorGraphGenerator(vertexCount: UInt16.max),
            randomDirectorGraphGenerator(vertexCount: UInt16.max),
            randomDirectorGraphGenerator(vertexCount: UInt16.max),
        ]
        
        let dgs2 = dgs.map { g in g.clone() }
        
        XCTAssertEqual(dgs, dgs2)
        
        for g in dgs {
            XCTAssertTrue(dgs2.contains(g))
        }
        
        XCTAssertFalse(dgs.contains(directedGraph1))
        XCTAssertFalse(dgs.contains(directedGraph2))
        XCTAssertFalse(dgs.contains(directedGraph3))
        XCTAssertFalse(dgs.contains(directedGraph4))
    }
}
