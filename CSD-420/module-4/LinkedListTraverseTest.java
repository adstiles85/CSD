/*
Name: Andrew Stiles
Course: CSD-420
Assignment: M4 – LinkedList Traversal Benchmark
Description: This program benchmarks traversal performance of LinkedList using an iterator and get(index) for 50,000 and 500,000 integers.
*/

import java.util.Iterator;
import java.util.LinkedList;

public class LinkedListTraverseTest {

    public static void main(String[] args) {
        testTraversal(50000);
        System.out.println("\n--------------------------------\n");
        testTraversal(500000);
    }

    public static void testTraversal(int size) {
        LinkedList<Integer> list = new LinkedList<>();

        // Fill the list
        for (int i = 0; i < size; i++) {
            list.add(i);
        }

        System.out.println("Testing traversal with LinkedList of size: " + size);

        // Traversal using Iterator
        long startTime = System.nanoTime();
        Iterator<Integer> iterator = list.iterator();
        while (iterator.hasNext()) {
            iterator.next();
        }
        long endTime = System.nanoTime();
        long iteratorTime = endTime - startTime;
        System.out.println("Iterator traversal time: " + iteratorTime + " ns");

        // Traversal using get(index)
        startTime = System.nanoTime();
        for (int i = 0; i < list.size(); i++) {
            list.get(i);
        }
        endTime = System.nanoTime();
        long getTime = endTime - startTime;
        System.out.println("get(index) traversal time: " + getTime + " ns");

        // Analysis comment
        System.out.println("\nPerformance Analysis:");
        System.out.println("Using an iterator is much faster than using get(index) on a LinkedList.");
        System.out.println("This is because LinkedList does not store items in a way that allows quick access by index.");
        System.out.println("Each time you use get(index), it has to count through the list from the beginning.");
        System.out.println("So doing that for every item in the list takes a lot longer.");
        System.out.println("An iterator goes through the list one item at a time, which is much more efficient.");
    }
}

