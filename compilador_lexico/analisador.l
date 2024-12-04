%{
	#include <stdio.h>
    #include "lista.h"
    Item *tabe = NULL;
    Lista *l = NULL;
    char err[10000];
    int linha = 1;
    int caractere = 0;
%}

%option noyywrap

DIGITO [0-9]+
LETRA [a-zA-z]
ID [a-zA-Z][a-zA-Z0-9]*
WHITESPACE [ \t]
ENTER [\n]
ERRO [@$¨~çÇ§¹²³£¢¬₢°`]
ASPAS ["]

%%

if      {strcat(err, yytext); tabe = inserir(tabe, yytext, "CONDICIONAL");}
else    {strcat(err, yytext); tabe = inserir(tabe, yytext, "CONDICIONAL");}

for     {strcat(err, yytext); tabe = inserir(tabe, yytext, "REPETICAO");}
while   {strcat(err, yytext); tabe = inserir(tabe, yytext, "REPETICAO");}

char|char*      {strcat(err, yytext); tabe = inserir(tabe, yytext, "TIPO DE DADO");}
int|int*        {strcat(err, yytext); tabe = inserir(tabe, yytext, "TIPO DE DADO");}
float|float*    {strcat(err, yytext); tabe = inserir(tabe, yytext, "TIPO DE DADO");}
double|double*  {strcat(err, yytext); tabe = inserir(tabe, yytext, "TIPO DE DADO");}
{ID}"*"         {strcat(err, yytext); tabe = inserir(tabe, yytext, "TIPO DE DADO");}

void    {strcat(err, yytext); tabe = inserir(tabe, yytext, "FUNCAO VAZIA");}
main    {strcat(err, yytext); tabe = inserir(tabe, yytext, "FUNCAO PRINCIPAL");}
print   {strcat(err, yytext); tabe = inserir(tabe, yytext, "FUNCAO DE SAIDA");}
scan    {strcat(err, yytext); tabe = inserir(tabe, yytext, "FUNCAO DE LEITURA");}
return  {strcat(err, yytext); tabe = inserir(tabe, yytext, "COMANDO DE RETORNO");}
import  {strcat(err, yytext); tabe = inserir(tabe, yytext, "COMANDO DE CABEÇALHO");}
define  {strcat(err, yytext); tabe = inserir(tabe, yytext, "COMANDO DE DEFINICAO");}

"+"     {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR SOMA");}
"-"     {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR SUBTRACAO");}
"/"     {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR DIVOSAO");}
"*"     {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR MULTIPLICACAO");}
"%"     {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR RESTO");}
"!"     {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR DE NEGACAO");}
"|"     {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR DE OR");}
"^"     {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR DE XOR");}
"&"     {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR DE AND");}

"&&"    {strcat(err, yytext); tabe = inserir(tabe, yytext, "AND LOGICO");}
"||"    {strcat(err, yytext); tabe = inserir(tabe, yytext, "OR LOGICO");}
"<<"    {strcat(err, yytext); tabe = inserir(tabe, yytext, "SHIFT LEFT");}
">>"    {strcat(err, yytext); tabe = inserir(tabe, yytext, "SHIFT RIGTH");}

"++"    {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR INCREMENTO");}
"--"    {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR DECREMENTO");}

"="     {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR ATRIBUICAO");}
"+="    {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR ATRIBUICAO COM SOMA");}
"-="    {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR ATRIBUICAO COM DECREMENTO");}
"*="    {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR ATRIBUICAO COM MULTIPLICACAO");}
"/="    {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR ATRIBUICAO COM DIVISAO");}
"%="    {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR ATRIBUICAO COM RESTO");}

"=="    {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR IGUALDADE0");}
"!="    {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR DIFERENTE");}
"<"     {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR MENOR");}
">"     {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR MAIOR");}
">="    {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR MAIOR IGUAL");}
"<="    {strcat(err, yytext); tabe = inserir(tabe, yytext, "OPERADOR MENOR IGUAL");}

","     {strcat(err, yytext); tabe = inserir(tabe, yytext, "VIRGULA");}
";"     {strcat(err, yytext); tabe = inserir(tabe, yytext, "PONTO E VIRGULA");}
":"     {strcat(err, yytext); tabe = inserir(tabe, yytext, "DOIS PONTO");}

"("     {strcat(err, yytext); tabe = inserir(tabe, yytext, "ABERTURA PARENTESES");}
")"     {strcat(err, yytext); tabe = inserir(tabe, yytext, "FECHAMENTO PARENTESE");}
"{"     {strcat(err, yytext); tabe = inserir(tabe, yytext, "ABERTURA CHAVES");}
"}"     {strcat(err, yytext); tabe = inserir(tabe, yytext, "FECHAMENTO CHAVES");}
"["     {strcat(err, yytext); tabe = inserir(tabe, yytext, "ABERTURA COLCHETE");}
"]"     {strcat(err, yytext); tabe = inserir(tabe, yytext, "FECHAMENTO COLCHETE");}

"."     {strcat(err, yytext); tabe = inserir(tabe, yytext, "ENCADEAMENTO");}
"->"    {strcat(err, yytext); tabe = inserir(tabe, yytext, "ENCADEAMENTO");}

"//"[^\n]*\n {strcat(err, yytext); tabe = inserir(tabe, yytext, "COMENTARIO");}
"/*"[^'*/']*"*/" {strcat(err, yytext); tabe = inserir(tabe, yytext, "COMENTARIO");}

{ID} {strcat(err, yytext); tabe = inserir(tabe, yytext, "IDENTIFICADOR");}

{DIGITO} {strcat(err, yytext); tabe = inserir(tabe, yytext, "DIGITO");}
\"[^\"]*\" {strcat(err, yytext); tabe = inserir(tabe, yytext, "STRING");}

{WHITESPACE} {strcat(err, yytext);}
{ENTER} {caractere = verificaErro(err, linha); linha++; strcpy(err, "");}
{ERRO} {strcat(err, yytext);}

[[:^space:]]+;

%%
int main(){	
    char str[50];
    int saida = 1;
    int opcao;
    FILE* arq;
    l = (Lista *) malloc (sizeof(Lista));

    menu();
    
        do{
            printf("\n1 - Ler arquivo correto: fonte1.txt\n");
            printf("2 - Ler arquivo com os erros: fonte2.txt\n");
            printf("3 - Imprimir tabela\n");
            printf("0 - Sair\n");

            scanf("%d", &opcao);

            switch(opcao) {
                case 1 : 
                    printf("\nDigite o caminho do arquivo: ");
                    scanf("%s", str);
                    arq = fopen(str, "r");
                    while(arq == NULL){
                        printf("Digite o caminho correto do arquivo: ");
                        scanf("%s", str);
                        arq = fopen(str, "r");
                    }

                    yyin = arq;
                    yylex(); 
                    break;

                case 2 : printf("\nDigite o caminho do arquivo com os erros: ");
                    scanf("%s", str);
                    arq = fopen(str, "r");
                    while(arq == NULL){
                        printf("Digite o caminho correto do arquivo: ");
                        scanf("%s", str);
                        arq = fopen(str, "r");
                    }
                    yyin = arq;
                    yylex();
                    
                    break;
                
                case 3 :  printf("\n");
                    imprimir(tabe);
                    break;
    
        }

    }while(opcao != 0);

    fclose(arq);     
	return 0;
}