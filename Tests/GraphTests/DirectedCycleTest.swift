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
        print("testCycle2 cycle = \(String(describing: cyc.getCycle))")
    }
    
    func testCycle3() {
        let digraph = DirectedGraph()
        digraph.addEdge(v: 0, w: 1)
        digraph.addEdge(v: 1, w: 2)
        digraph.addEdge(v: 2, w: 0)
        
        let cyc = DirectedCycle(graph: digraph)
        XCTAssertTrue(cyc.hasCycle)
        print("testCycle3 cycle = \(String(describing: cyc.getCycle))")
    }
}
