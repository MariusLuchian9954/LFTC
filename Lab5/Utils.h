#include <map>

#include <iterator>
#include <vector>
#include <iostream>
#include <fstream>
#include <string>
#include <algorithm>

using namespace std;

vector<string> TS;  




typedef struct {
 int n;
 int elem[200][2];
} FIP;




void addFIP(int cod, int posTS, FIP& f){
 f.elem[f.n][0]=cod;
 f.elem[f.n++][1]=posTS;
}

int addTS(vector<string>&ts, string token){
	 
     vector<string>::iterator it = find(ts.begin(), ts.end(), token) ;
	 if(it== ts.end()) {
	   ts.push_back(token);
	   return ts.size()-1;
	 }
	return std::distance(ts.begin(),it);
	
}

FIP fip;
int pozTS = 0;

void printTS(vector<string>& ts){
ofstream tsFile;
    tsFile.open("TS.txt");
  cout<<"Tabela de simboluri:"<<endl;
  for (int i=0; i<ts.size();i++){
    cout <<i<<" "<< ts[i] << endl;
    tsFile <<i<<" "<< ts[i] << endl;
}
tsFile.close();
}

void printFIP(FIP& f){
	ofstream fipFile;
    fipFile.open("FIP.txt");
	cout<<"Numar de elemente in tabela fip "<<f.n<<endl;
	cout<<"Forma interna a programului: "<<endl;
	for(int i=0;i<f.n;i++){
		fipFile<<f.elem[i][0]<<" "<<f.elem[i][1]<<endl;
	         cout<<f.elem[i][0]<<" "<<f.elem[i][1]<<endl;
	}

	fipFile.close();
}
