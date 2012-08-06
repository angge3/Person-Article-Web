package pazzle;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
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
	private static  Map<String,Person> evil = new HashMap<String,Person>();
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
		//int timeCount = 0;
		escape(sx,sy);
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
	
}
