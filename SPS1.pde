PImage[] flags; // Et arrayList til at gemme flagbilleder
// En String ArrayListe over landenes navne så det kan bruges senere
String[] flagNames = {"Russia", "Saudi", "Egypt", "Uruguay", "France", "Australia", "Peru", "Denmark", "Portugal", "Spain", "Morocco", "Iran", "Argentina", "Iceland", "Croatia", "Nigeria"};
// En String Array med navne på grupperne som er de 4 grupper
String[] groups = {"GROUP A", "GROUP C", "GROUP B", "GROUP D"};
// En String Array filnavne på flagbilleder 
String[] imageFiles = {"Russia.png", "Saudi.png", "egypt.png", "Uruguay.png", "France.png", "Aussie.png", "Peru.png", "Denmark.png", "Portugal.png", "Spain.png", "Moro.png", "Iran.png", "Argen.png", "Iceland.png", "Croatia.png", "Nigeria.png"};

void setup() {
  size(760, 400); // Sætter størrelsen på vinduet til 760x400 pixels
  flags = new PImage[flagNames.length]; // Initialiserer arrayet til at holde flagbilleder
  for (int i = 0; i < flagNames.length; i++) { // Sætter en løkke for-loop, der kører en gang for hvert flag 
    flags[i] = loadImage(imageFiles[i]); // Indlæser billedfilen fra imageFiles-arrayet og gemmer den i flags-arrayet
  }
}

void draw() {
  background(51, 66, 100); // Baggrunds farven til mørkeblå 

  // Tegner en lodret linje i midten af skærmen
  stroke(255); // En hvid farve til linjen 
  strokeWeight(3); // Laver tykkelsen af linjen på 3
  line(375, 0, 375, 400); // Linjens position som går fra top til bunden i midten

  // Tegner de 4 grupper 
  drawGroup(150, 18, 0, "SegoeUI-Bold-30.vlw", #16DDF5, 0, 25, 365); // Gruppe A som er blå 
  drawGroup(530, 18, 4, "SegoeUI-Bold-30.vlw", #16DDF5, 385, 25, 365); // Gruppe C blå 
  drawGroup(150, 202, 8, "SegoeUI-Bold-30.vlw", #F3FA47, 0, 210, 365); // Gruppe B gul 
  drawGroup(530, 202, 12, "SegoeUI-Bold-30.vlw", #F3FA47, 385, 210, 365); // Gruppe D gul 
}

// Skriver en funktion til at tegne en gruppe af 4 hold 
void drawGroup(int x, int y, int startIndex, String fontName, int groupColor, int rectX, int rectY, int rectWidth) {
  PFont font = loadFont(fontName); // Indlæser fonten som er angivet i variablen fonName
  textFont(font, 18); // Sætter font størrelsen til 18 
  fill(groupColor); // Sætter farven på selv gruppens navn
  text(groups[startIndex / 4], x, y); // Skriver gruppens navn på skærmen 

  for (int i = 0; i < 4; i++) { // En for.loop der går igennem de 4 hold i en gruppe, som også sørger for at alle bliver tegnet
    drawFlag(rectX, rectY + i * 39, rectWidth, flags[startIndex + i], flagNames[startIndex + i]);
    // Tegner hvert holds flag og navn 
  }
}

// Bruger void drawFlag funktionen til at tegne et flag med landets navn
void drawFlag(int x, int y, int width, PImage flag, String name) {
  fill(255); // Laver hvid baggrund for flaget 
  rect(x, y, width, 32); // En rektangel til flaget med højde på 32 
  fill(0, 0, 0, 70); // Sætter halvgennemsigtig sort farve
  noStroke(); // Ingen kantlinjer 
  rect(x + 65, y, 10, 32); // Tegner en sort skygge effekt flagets kant 
  image(flag, x, y, 65, 32); // Tegner flaget 65x32 pixels
  PFont fontR = loadFont("LeelawadeeUI-Bold-30.vlw"); // Sætter en fed skriftype til landets navne 
  fill(0); // Bruger sort farve til tekst 
  textFont(fontR, 24); // Sætter tekststørrelsen til 24 
  text(name.toUpperCase(), x + 83, y + 24); // Skriver landets navne med store bogstaver, som justere til center 
}
