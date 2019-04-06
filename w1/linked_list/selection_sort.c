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
	struct node *node1_right = node1->next,
				*node2_left = node2->prev;

	tmp_node = node2->next;
	tmp_node->prev = node1;
	node1->next = tmp_node;
	tmp_node = node1->prev;
	tmp_node->next = node2;
	node2->prev = tmp_node;

	if (node1_right == node2) {
		node1->prev = node1_right;
		node2->next = node2_left;
	}
	else {
		node1->prev = node2_left;
		node2_left->next = node1;
		node2->next = node1_right;
		node1_right->prev = node2;
	}

	if (*start == node1)
		*start = node2;
}

void display(struct node *start) {
    struct node *temp = start;
    printf("Traversal in forward direction \n");
    for (; temp->next != start; temp = temp->next)
	    printf("%d ", temp->data);
    printf("%d ", temp->data);
    printf("\n");
}

void selection_sort(struct node **start) {
	struct node *selection = *start;

	for (struct node *counter1 = *start, *n = (*start)->next; \
			counter1 != (*start)->prev; \
			counter1 = n, n = counter1->next) {
		selection = counter1;
		for (struct node *counter2 = counter1; \
				counter2 != (*start)->prev; counter2 = counter2->next) {
			if (selection->data > counter2->next->data)
				selection = counter2->next;
		}
		swap(start, counter1, selection);
	}
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

	selection_sort(&start);
    display(start);
    return 0;
}
