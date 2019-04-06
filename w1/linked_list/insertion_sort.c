#include <stdlib.h>
#include <stdio.h>

struct node { int data; struct node *next, *prev; };

void insert_tail(struct node **start, int value) {
    if (!*start) {
        struct node *new_node = malloc(sizeof(struct node));
        new_node->data = value;
        new_node->next = new_node->prev = new_node;
        *start = new_node;
        return;
    }
    struct node *last = (*start)->prev;
    struct node *new_node = malloc(sizeof(struct node));
    new_node->data = value;
    new_node->next = *start;
    (*start)->prev = new_node;
    new_node->prev = last;
    last->next = new_node;
}

void insert(struct node **start, int value) {
    struct node *last = (*start)->prev;
    struct node *new_node = malloc(sizeof(struct node));
    new_node->data = value;
    new_node->next = *start;
    new_node->prev = last;
    last->next = (*start)->prev = new_node;
    *start = new_node;
}

void insert_after(struct node **start, int value1, int value2) {
    struct node *new_node = malloc(sizeof(struct node));
    new_node->data = value1;
    struct node *temp = *start;
    while (temp->data != value2)
        temp = temp->next;
    struct node *next = temp->next;
    temp->next = new_node;
    new_node->prev = temp;
    new_node->next = next;
    next->prev = new_node;
}

void swap(struct node **start, struct node *node1, struct node *node2) {
	struct node *tmp_node;

	tmp_node = node2->next;
	tmp_node->prev = node1;
	node1->next = tmp_node;

	tmp_node = node1->prev;
	tmp_node->next = node2;
	node2->prev = tmp_node;

	node1->prev = node2;
	node2->next = node1;

	if (*start == node1)
		*start = node2;
}

void insertion_sort(struct node **start) {

	struct node *counter1 = *start,
				*n = counter1->next;
	do {
		for (struct node *counter2 = counter1, *m = counter2->prev; \
				counter2 != *start; counter2 = m, m = counter2->prev) {
			if (counter2->data < counter2->prev->data)
				swap(start, counter2->prev, counter2);
		}
		counter1 = n;
		n = counter1->next;
	} while (counter1 != *start);
}

void display(struct node *start) {
    struct node *temp = start;
    printf("Traversal in forward direction \n");
    for (; temp->next != start; temp = temp->next)
	    printf("%d ", temp->data);
    printf("%d ", temp->data);
    printf("\n");
}

int main() {
    struct node *start = NULL;
    insert_tail(&start, 5);
	insert_tail(&start, 9);
	insert_tail(&start, 8);
	insert_tail(&start, 2);
	insert_tail(&start, 2);
	insert_tail(&start, 7);
	insert_tail(&start, 6);
	insert_tail(&start, 4);
	insert_tail(&start, 2);
    display(start);

	insertion_sort(&start);
    display(start);
    return 0;
}
