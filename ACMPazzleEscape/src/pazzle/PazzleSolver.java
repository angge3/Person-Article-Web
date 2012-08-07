package pazzle;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Stack;

public class PazzleSolver {
	private static  char[][] map;
	private static  int w;
	private static  int h;
	private static  int m;
	private static  int q;
	private static  int p;
	private static  int r;
	private static  int sx;
	private static  int sy;
	private static  Person hero;
	private static int energy ;
	private static  Map<String,Person> evil = new HashMap<String,Person>();
	private static Stack<Point> pointTrack = new Stack<Point>();
	private static int times = Integer.MAX_VALUE;
	static{
		try {
			BufferedReader reader = new BufferedReader(new FileReader(new File("exampleInput.txt")));
			String tempLine = reader.readLine();
			String[] temp = tempLine.split(" ");
			w = Integer.parseInt(temp[0]);
			h = Integer.parseInt(temp[1]);
			p = Integer.parseInt(temp[2]);
			q = Integer.parseInt(temp[3]);
			r = Integer.parseInt(temp[4]);
			m = Integer.parseInt(temp[5]);
			
			map = new char[w][h];
			for(int i=0; i<w; i++){
				tempLine = reader.readLine();
				for(int j=0 ; j<h; j++){
					map[i][j] = tempLine.charAt(j);
					if(map[i][j] == 'S'){
						sx=i;
						sy=j;
					}
				}
			}
			
			tempLine = reader.readLine();
			temp = tempLine.split(" ");
			hero = new Person(Integer.parseInt(temp[0]),Integer.parseInt(temp[1]),Integer.parseInt(temp[2]));
			energy = hero.getLife();
			for(int i =0; i<m; i++){
				tempLine = reader.readLine();
				temp = tempLine.split(" ");
				evil.put(temp[0], new Person(Integer.parseInt(temp[1]),Integer.parseInt(temp[2]),Integer.parseInt(temp[3])));
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String args[]){
		int timeCount = 1;
		//escape(sx,sy);
		pointTrack.push(new Point(sx,sy));
		Stack<Point> s1 = new Stack<Point>();
		Stack<Point> s2 = new Stack<Point>();
		Stack<Point> s3 = new Stack<Point>();
		Stack<Point> s4 = new Stack<Point>();
		boolean flag = false;
		if(escapeOneStep(sx,sy-1,s1,timeCount,hero)) flag = true;
		if(escapeOneStep(sx,sy+1,s2,timeCount,hero)) flag = true;
		if(escapeOneStep(sx-1,sy,s3,timeCount,hero)) flag = true;
		if(escapeOneStep(sx+1,sy,s4,timeCount,hero)) flag = true;
		for(int i=0; i<w; i++){
			for(int j=0 ; j<h; j++){
				System.out.print(map[i][j]);
			}
			System.out.println();
		}
		if(flag&&times<=100){
			DecimalFormat   df   =   new   DecimalFormat( "0.####");
			System.out.println(df.format(energy/(double)times));
		}else{
			System.out.println("impossible");
		}
		
	}
	
	public static void escape(int sx, int sy){
		Stack<Point> s = new Stack<Point>(); 
		char nowChar = 'S';
		while(nowChar!='E'){
			sy--;
			if(map[sx][sy]=='.'||map[sx][sy]=='S'||map[sx][sy]=='E'){
				nowChar = map[sx][sy];
				s.push(new Point(sx,sy).print());
			}else{
				sy++;
				sy++;
				if(map[sx][sy]=='.'||map[sx][sy]=='S'||map[sx][sy]=='E'){
					nowChar = map[sx][sy];
					s.push(new Point(sx,sy).print());
					map[sx][sy] = '#';
				}else{
					sy--;
					sx++;
					if(map[sx][sy]=='.'||map[sx][sy]=='S'||map[sx][sy]=='E'){
						nowChar = map[sx][sy];
						s.push(new Point(sx,sy).print());
						map[sx][sy] = '#';
					}else{
						sx--;
						sx--;
						if(map[sx][sy]=='.'||map[sx][sy]=='S'||map[sx][sy]=='E'){
							nowChar = map[sx][sy];
							s.push(new Point(sx,sy).print());
							map[sx][sy] = '#';
						}else{
							sx++;
							if(s.empty()){
								System.out.println("impossible");
								break;
							}else{
								map[sx][sy]='#';
								Point p = s.pop();
								sx = p.getX();
								sy = p.getY();
								nowChar = map[sx][sy];
							}
						}
					}
				}
			}
		}
		
		if(nowChar == 'E'){
			System.out.println("escape successfully!");
		}
	}
	
	
	public static boolean escapeOneStep(int sx,int sy,Stack<Point> s,int time,Person andy){
		boolean flag = false;
		if(map[sx][sy]=='E'){
			//System.out.println("escape successfully!");
			flag = true;
			//System.out.println("time : "+time);
			if(times>time)
				times = time;
			//System.out.println("andy life:"+andy.getLife());
		}
		else{
			if(map[sx][sy]=='S'||map[sx][sy]=='.'||Character.isDigit(map[sx][sy])||Character.isUpperCase(map[sx][sy])){
				
				if(Character.isDigit(map[sx][sy])){
					if(killMonster(andy, map[sx][sy])){
						Point temp = pointTrack.pop();
						pointTrack.push(new Point(sx,sy));
						
						if(!(temp.getX()==sx&&temp.getY()==(sy-1))){
							map[sx][sy]='@';
							if(escapeOneStep(sx,sy-1,s,time+1,andy)) flag=true;
							map[sx][sy]='.';
						}
						if(!(temp.getX()==sx&&temp.getY()==(sy+1))){
							map[sx][sy]='@';
							if(escapeOneStep(sx,sy+1,s,time+1,andy)) flag=true;
							map[sx][sy]='.';
						}
						if(!(temp.getX()==(sx-1)&&temp.getY()==sy)){
							map[sx][sy]='@';
							if(escapeOneStep(sx-1,sy,s,time+1,andy)) flag=true;
							map[sx][sy]='.';
						}
						if(!(temp.getX()==(sx+1)&&temp.getY()==sy)){
							map[sx][sy]='@';
							if(escapeOneStep(sx+1,sy,s,time+1,andy)) flag=true;
							map[sx][sy]='.';
						}
					}
				}else{
					if(Character.isUpperCase(map[sx][sy])){
						getSupply(andy,map[sx][sy]);
					}
					Point temp = pointTrack.pop();
					pointTrack.push(new Point(sx,sy));
					
					if(!(temp.getX()==sx&&temp.getY()==(sy-1))){
						map[sx][sy]='@';
						if(escapeOneStep(sx,sy-1,s,time+1,andy)) flag=true;
						map[sx][sy]='.';
					}
					if(!(temp.getX()==sx&&temp.getY()==(sy+1))){
						map[sx][sy]='@';
						if(escapeOneStep(sx,sy+1,s,time+1,andy)) flag=true;
						map[sx][sy]='.';
					}
					if(!(temp.getX()==(sx-1)&&temp.getY()==sy)){
						map[sx][sy]='@';
						if(escapeOneStep(sx-1,sy,s,time+1,andy)) flag=true;
						map[sx][sy]='.';
					}
					if(!(temp.getX()==(sx+1)&&temp.getY()==sy)){
						map[sx][sy]='@';
						if(escapeOneStep(sx+1,sy,s,time+1,andy)) flag=true;
						map[sx][sy]='.';
					}
				}
				
			}
			
			
		}
		if(flag) s.push(new Point(sx,sy)); else time--;
		return flag;
	}
	
	public static void getSupply(Person andy,char mark){
		switch(mark){
			case 'A': andy.setLife(andy.getLife()+p);
			case 'B': andy.setAttack(andy.getAttack()+q);
			case 'C': andy.setDefend(andy.getDefend()+r);
		}
	}
	
	public static boolean killMonster(Person andy,char mark){
		Person monster = evil.get(mark+"");
		while(andy.getLife()>0&&monster.getLife()>0){
			int loseLife = monster.getAttack()-andy.getDefend();
			if(loseLife<0) loseLife=0;
			andy.setLife(andy.getLife()-loseLife);
			int monsterLoseLife = andy.getAttack()-monster.getDefend();
			if(monsterLoseLife<0) monsterLoseLife=0;
			monster.setLife(monster.getLife()-monsterLoseLife);
		}
		boolean flag = true;
		if(andy.getLife()<=0)
			flag =  false;
		if(monster.getLife()<=0)
			flag =  true;
		return flag;
	}
	
}
