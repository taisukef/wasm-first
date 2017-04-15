#define SIZE 10

int mem[SIZE];

int* getMemory() {
	return mem;
}
int getMemorySize() {
	return SIZE;
}
int calc() {
	int sum = 0;
	for (int i = 0; i < SIZE; i++) {
		sum += mem[i];
	}
	return sum;
}
