#include "lista.h"

void menu(){
   printf("\n===== Jovial C++ =====\n");
}

int vazia(Item *item){
   return (item == NULL);
}

Item *inserir(Item *item, char *nome, char *token){
   if(busca(item, nome)==NULL){
      Item *aux = (Item *)malloc(sizeof(Item));
      strcpy(aux->nome, nome);
      strcpy(aux->token, token);
      aux->prox = item;      
      return aux;
   }
   return item;
}

Item *busca (Item *item, char* str){
   Item *aux = item;
   for(; aux != NULL; aux = aux->prox){
      if(strcmp(aux->nome, str) == 0) return aux;
   }
   return aux;
}

void imprimir(Item *item){
   if(vazia(item)){
      return;
   }else{
      imprimir(item->prox);
      printf("[%s] --> ", item->nome);
      printf("[%s]\n", item->token);
   }
}

int verificaErro(char* str, int linha){
   char erro[] = "@$¨~çÇ§¹²³£¢¬₢°`";
   int pos = strcspn(str, erro);
   if(pos == strlen(str)){
      return 0;
   }else{
      printf("\n\tERRO NA LINHA %d CARACTER %d: %s\n\n", linha, pos+1, str);
      return pos;
   }
}

Item *limpa(Item *item){
   if(!vazia(item)){
      item->prox = limpa(item->prox);
      free(item);
      return NULL;
   }
   return NULL;
}


