package pazzle;

public class Person {
	private int life;
	private int attack;
	private int defend;

	
	public int getLife() {
		return life;
	}
	public void setLife(int life) {
		this.life = life;
	}
	public int getAttack() {
		return attack;
	}
	public void setAttack(int attack) {
		this.attack = attack;
	}
	public int getDefend() {
		return defend;
	}
	public void setDefend(int defend) {
		this.defend = defend;
	}
	
	
	
	public Person(){
		
	}
	
	public Person(int e,int a, int d){
		life = e;
		attack = a;
		defend = d;
	}
}
