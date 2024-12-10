public class Solution {
    private Dictionary<string, LinkedList<string>> flightMap = new Dictionary<string, LinkedList<string>>();
    private LinkedList<string> result = new LinkedList<string>();

    public IList<string> FindItinerary(IList<IList<string>> tickets) {
        foreach (var ticket in tickets) {
            if (!flightMap.ContainsKey(ticket[0])) {
                flightMap[ticket[0]] = new LinkedList<string>();
            }
            flightMap[ticket[0]].AddLast(ticket[1]);
        }

        foreach (var key in flightMap.Keys) {
            var sortedList = flightMap[key].OrderBy(dest => dest).ToList();
            flightMap[key] = new LinkedList<string>(sortedList);
        }

        DFS("JFK");
        return result.ToList();
    }

    private void DFS(string origin) {
        while (flightMap.ContainsKey(origin) && flightMap[origin].Count > 0) {
            var nextDest = flightMap[origin].First();
            flightMap[origin].RemoveFirst();
            DFS(nextDest);
        }
        result.AddFirst(origin);
    }
}
