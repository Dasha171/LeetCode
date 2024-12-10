using System;
using System.Collections.Generic;

public class RandomizedCollection {
    private Dictionary<int, HashSet<int>> dict;
    private List<int> list;
    private Random rand;

    public RandomizedCollection() {
        dict = new Dictionary<int, HashSet<int>>();
        list = new List<int>();
        rand = new Random();
    }

    public bool Insert(int val) {
        bool exists = dict.ContainsKey(val);
        if (!exists) {
            dict[val] = new HashSet<int>();
        }
        dict[val].Add(list.Count);
        list.Add(val);
        return !exists;
    }

    public bool Remove(int val) {
        if (!dict.ContainsKey(val) || dict[val].Count == 0) {
            return false;
        }
        int index = dict[val].First();
        dict[val].Remove(index);
        int lastElement = list[list.Count - 1];
        list[index] = lastElement;
        dict[lastElement].Add(index);
        dict[lastElement].Remove(list.Count - 1);
        list.RemoveAt(list.Count - 1);
        if (dict[val].Count == 0) {
            dict.Remove(val);
        }
        return true;
    }

    public int GetRandom() {
        return list[rand.Next(list.Count)];
    }
}
