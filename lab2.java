package LAB2;

import java.util.*;

public class lab2 {

    private final static List<String> CUVINTE = List.of("declare", "int", "string", "char", "boolean", "div", "mod", "print", "read",
            "if", "elif", "else", "True", "False", "for", "while", "increase", "by", "start", "end", "break");

    private final Map<String, Integer> symbolTable = null;

	private Hashtable<?, ?> TEXT_hashtable;

    public void TEXT_hashtable() {
        this.TEXT_hashtable = new Hashtable<>();
    }

    public int add(String text) {
        int position = getPosition(text);
        if (!symbolTable.containsKey(text) && !CUVINTE.contains(text)) {
            symbolTable.put(text, position);
        }
        return position;
    }

    public int getPosition(String text) {
        return text.length() % 10;
    }

    public Map<String, Integer> getTEXT_hashtable(){
        return (Map<String, Integer>) TEXT_hashtable;
    }

    @Override
    public String toString() {
        return "TEXT_hashtable(){" +
                "TEXT_hashtable=" + TEXT_hashtable +
                '}';
    }
}