#include <stdlib.h>
#include <stdio.h>

struct node { int data; struct node *next, *prev; };

void insert(struct node **start, int value) {
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

void insert_head(struct node **start, int value) {
    struct node *last = (*start)->prev;
    struct node *new_node = malloc(sizeof(struct node));
    new_node->data = value;
    new_node->next = *start;
    new_node->prev = last;
    last->next = (*start)->prev = new_node;
    *start = new_node;
}

int get_length(struct node **start) {
	int length = 1;

	for (struct node *counter = *start; \
			counter != (*start)->prev; counter = counter->next)
		length += 1;

	return length;
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

struct node *copy_list(struct node **start, int l, int r) {
	struct node *new = NULL;
	struct node *counter = *start;

	for (int i = 0; i <= r; ++i) {
		if (i >= l)
			insert(&new, counter->data);
		counter = counter->next;
	}

	return new;
}

int get_ith_data(struct node **start, int n) {
	struct node *counter = *start;
	for (int i = 0; i < n; ++i)
		counter = counter->next;

	return counter->data;
}

void change_ith_data(struct node **start, int n , int value) {
	struct node *counter = *start;
	for (int i = 0; i < n; ++i)
		counter = counter->next;
	counter->data = value;
}

void merge(struct node **start, int l, int m, int r) {

	int n1 = m - l + 1;
	int n2 = r - m;

	struct node *left = copy_list(start, l, m);
	struct node *right = copy_list(start, m+1, r);

	int i = 0, j = 0, k = l;

	int left_data, right_data;

	while (i < n1 && j < n2) {
		left_data = get_ith_data(&left, i);
		right_data = get_ith_data(&right, j);

		if (left_data < right_data) {
			change_ith_data(start, k, left_data);
			i++;
		}
		else {
			change_ith_data(start, k, right_data);
			j++;
		}
		k++;
	}

	while (i < n1) {
		change_ith_data(start, k, get_ith_data(&left, i));
		i += 1;
		k += 1;
	}

	while (j < n2) {
		change_ith_data(start, k, get_ith_data(&right, j));
		j += 1;
		k += 1;
	}
}


void merge_sort(struct node **start, int l, int r) {
	if (l < r) {
		int m = l + (r-l)/2;

		merge_sort(start, l, m);
		merge_sort(start, m+1, r);

		merge(start, l, m, r);
	}
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
    insert(&start, 5);
	insert(&start, 9);
	insert(&start, 8);
	insert(&start, 2);
	insert(&start, 2);
	insert(&start, 7);
	insert(&start, 6);
	insert(&start, 4);
	insert(&start, 2);
    display(start);
	int length = get_length(&start);
	merge_sort(&start, 0, length-1);
	display(start);
    return 0;
}
