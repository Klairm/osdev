#define FB_ADDRESS 0x000B8000
#define COLUMNS 80
#define ROWS 25
#define FB_SIZE  (COLUMNS * ROWS)

unsigned short  *framebuffer = (unsigned short * ) FB_ADDRESS;

void writeChar(char ch, unsigned short i){
  framebuffer[i] = (unsigned short) ch | (0x07 << 8 );
}

void clearScreen(){
  
  for(int i = 0; i < FB_SIZE; i++ ){
    writeChar(' ',i);
  }
  

}

void print(char* string,int stringLength){

  for(int i = 0; i < stringLength;i++){

    writeChar(string[i],i); // not really correct 
  }
  

}


int main(){

  clearScreen();

  print("Hello World",11);


  
  
}

