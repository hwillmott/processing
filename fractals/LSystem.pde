class LSystem
{
	String sentence;
	Hashtable rules;

	LSystem(String axiom, Hashtable rules)
	{
		this.sentence = axiom;
		this.rules = rules;
	}

	String getSentence()
	{
		return this.sentence;
	}

	void generate()
	{
		String newSentence = "";
		for (int i = 0; i < this.sentence.length(); i++) 
		{
			char c = this.sentence.charAt(i);
			if (this.rules.containsKey(c))
			{
				newSentence += this.rules.get(c);
			}
			else
			{
				newSentence += Character.toString(c);
			}
		}
		this.sentence = newSentence;
		println(this.sentence);
	}
}