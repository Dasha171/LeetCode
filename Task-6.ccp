using System;
using System.Collections.Generic;

public class LFUCache {
    private Dictionary<int, LinkedList<(int, int)>> frequencies = new Dictionary<int, LinkedList<(int, int)>>();
    private Dictionary<int, (int, LinkedListNode<(int, int)>)> cache = new Dictionary<int, (int, LinkedListNode<(int, int)>)>();
    private int capacity;
    private int minf;

    public LFUCache(int capacity) {
        this.capacity = capacity;
        this.minf = 0;
    }
    private void Insert(int key, int frequency, int value) {
        if (!frequencies.ContainsKey(frequency)) {
            frequencies[frequency] = new LinkedList<(int, int)>();
        }
        frequencies[frequency].AddLast((key, value));
        cache[key] = (frequency, frequencies[frequency].Last);
    }
    public int Get(int key) {
        if (!cache.ContainsKey(key)) return -1;
        var (frequency,        node) = cache[key];
        frequencies[frequency].Remove(node);
        if (frequencies[frequency].Count == 0) {
            frequencies.Remove(frequency);
            if (minf == frequency) minf++;
        }
        Insert(key, frequency + 1, node.Value.Item2);
        return node.Value.Item2;
    }
    public void Put(int key, int value) {
        if (capacity <= 0) return;
        if (cache.ContainsKey(key)) {
            cache[key].node.Value = (key, value);
            Get(key);
            return;
        }
        if (cache.Count == capacity) {
            var oldest = frequencies[minf].First.Value;
            frequencies[minf].RemoveFirst();
            cache.Remove(oldest.Item1);
            if (frequencies[minf].Count == 0) frequencies.Remove(minf);
        }
        minf = 1;
        Insert(key, 1, value);
    }
}
