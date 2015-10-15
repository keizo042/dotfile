
#define STACK_SIZE 3

void stackinit(void);
void push(int x);
int pop(void);

struct unit{
	int data;
	struct unit *next;
};
struct unit* head;

void stackinit(void){
	head =NULL;

}
void push(int x){
	struct unit *r;
	r = (struct unit *)malloc(sizeof(struct unit));
	r->next = NULL;
	head  = r;
	r->data =x;
}
int pop(void){
	struct unit *r;
	int val;
	if(head = NULL){
		printf("stack is empty\n");
		return -1;
	}
	else{
		r = head;
		val = r->data;
		head = head->next;
		free(r);
		return val;
	}
}


