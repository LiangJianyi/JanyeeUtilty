import XCTest
import Graph

final class DirectedCycleTests: XCTestCase {
    func testCycle1() {
        let digraph = DirectedGraph()
        digraph.addEdge(v: 0, w: 1)
        digraph.addEdge(v: 1, w: 2)
        digraph.addEdge(v: 2, w: 3)
        
        let cyc = DirectedCycle(graph: digraph)
        XCTAssertFalse(cyc.hasCycle)
    }
    
    func testCycle2() {
        let digraph = DirectedGraph()
        digraph.addEdge(v: 0, w: 1)
        digraph.addEdge(v: 1, w: 2)
        digraph.addEdge(v: 2, w: 1)
        
        let cyc = DirectedCycle(graph: digraph)
        XCTAssertTrue(cyc.hasCycle)
        print("testCycle2 cycle = \(String(describing: cyc.getCycle!))")
    }
    
    func testCycle3() {
        let digraph = DirectedGraph()
        digraph.addEdge(v: 0, w: 1)
        digraph.addEdge(v: 1, w: 2)
        digraph.addEdge(v: 2, w: 0)
        
        let cyc = DirectedCycle(graph: digraph)
        XCTAssertTrue(cyc.hasCycle)
        print("testCycle3 cycle = \(String(describing: cyc.getCycle!))")
    }
    
    func testCycle4() {
        let digraph = DirectedGraph()
        digraph.addEdge(v: 0, w: 1)
        digraph.addEdge(v: 1, w: 2)
        digraph.addEdge(v: 2, w: 3)
        digraph.addEdge(v: 3, w: 4)
        digraph.addEdge(v: 4, w: 5)
        digraph.addEdge(v: 5, w: 6)
        digraph.addEdge(v: 7, w: 0)
        digraph.addEdge(v: 8, w: 1)
        digraph.addEdge(v: 9, w: 2)
        digraph.addEdge(v: 10, w: 3)
        digraph.addEdge(v: 11, w: 4)
        digraph.addEdge(v: 12, w: 5)
        digraph.addEdge(v: 13, w: 6)
        XCTAssertFalse(digraph.hasCycle())
        
        // 添加6个副本并将它们连线产生有向环
        let dg1 = digraph.clone()
        dg1.addEdge(v: 8, w: 7)
        dg1.addEdge(v: 1, w: 8)
        XCTAssertTrue(dg1.hasCycle())
        
        let dg2 = digraph.clone()
        dg2.addEdge(v: 9, w: 8)
        dg2.addEdge(v: 2, w: 9)
        XCTAssertTrue(dg2.hasCycle())
        
        let dg3 = digraph.clone()
        dg3.addEdge(v: 10, w: 9)
        dg3.addEdge(v: 3, w: 10)
        XCTAssertTrue(dg3.hasCycle())
        
        let dg4 = digraph.clone()
        dg4.addEdge(v: 11, w: 10)
        dg4.addEdge(v: 4, w: 11)
        XCTAssertTrue(dg4.hasCycle())
        
        let dg5 = digraph.clone()
        dg5.addEdge(v: 12, w: 11)
        dg5.addEdge(v: 5, w: 12)
        XCTAssertTrue(dg5.hasCycle())
        
        let dg6 = digraph.clone()
        dg6.addEdge(v: 13, w: 12)
        dg6.addEdge(v: 6, w: 13)
        XCTAssertTrue(dg6.hasCycle())
    }
}
