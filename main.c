#include <stdlib.h>
#include <graphics.h>
#include <conio.h>

int main(int argc, char *argv[]) {
	int gd = DETECT, gm;
	initgraph(&gd, &gm, "C:\\TC\\BGI");
	// Poèetak programa
	outtextxy(10, 10, "Radi");
	circle(100, 100, 50);
	// Kraj programa
	getch();
	return 0;
}

