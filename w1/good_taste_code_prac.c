#include <stdio.h>

#define GRID_SIZE 10

void init(int grid[GRID_SIZE][GRID_SIZE]){
	for (int i = 0; i < GRID_SIZE; ++i) {
		for (int j = 0; j < GRID_SIZE; ++j)
			grid[i][j] = 0;
	}
}

void init1(int grid[GRID_SIZE][GRID_SIZE]) {

	for (int r = 0; r < GRID_SIZE; ++r) {
		for (int c = 0; c < GRID_SIZE; ++c) {

			// top
			if (r == 0)
				grid[r][c] = 2;

			// right
			if (c == 0)
				grid[r][c] = 2;

			// left
			if (c == GRID_SIZE-1)
				grid[r][c] = 2;

			// button
			if (r == GRID_SIZE-1)
				grid[r][c] = 2;
		}
	}

}

void init2(int grid[GRID_SIZE][GRID_SIZE]) {

	for (int i = 0; i < GRID_SIZE; ++i) {
		grid[0][i] = 1;
		grid[i][0] = 1;
		grid[GRID_SIZE-1][i] = 1;
		grid[i][GRID_SIZE-1] = 1;
	}
}

void print(int grid[GRID_SIZE][GRID_SIZE]) {

	for (int i = 0; i < GRID_SIZE; ++i) {
		for (int j = 0; j < GRID_SIZE; ++j)
			printf("%d ", grid[i][j]);
		printf("\n");
	}
}

int main() {

	int grid[GRID_SIZE][GRID_SIZE];

	init(grid);

	init1(grid);
	print(grid);

	printf("\n");

	init2(grid);
	print(grid);


	return 0;
}
