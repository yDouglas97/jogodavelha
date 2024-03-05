Algoritmo "Jogo da velha"
//Aluno: Douglas Barreto - Avaliação final - Lógica programação.
//Professor: Washington Luis Souza
tipo
   cadastro = registro
      nome:caractere
      idade:inteiro
      pontuacao:real
   fimregistro
Var
   A:vetor[1..3,1..3] de caractere
   B:vetor[1..9] de inteiro
   R:vetor[1..10] de cadastro
   i,j,z,c,l,k:inteiro
   jg1,jg2,continuar,resp,nome_vencedor,nome,ap,aux_nome:caractere
   jg1s,jg2s,venced,ao_menos_dois_playes,situacao,playes_select:logico
   opcao,terminar,aux_idade:inteiro
   joga_vez,kl,player_nome:caractere
   partidas_jogadas:inteiro
   aux:real

procedimento v1 ()  //Procedimento para implementar na MATRIZ (tabuleiro), a posição do PLAYER 1
inicio

   se (joga_vez = jg1) entao
      kl <- "X"
   senao
      se (joga_vez = jg2) entao
         kl <- "O"
      fimse
   fimse

   se (c = 1) entao
      A[1,1] <- kl
   senao
      se (c = 2) entao
         A[1,2] <- kl
      senao
         se (c = 3) entao
            A[1,3] <- kl
         senao
            se (c = 4) entao
               A[2,1] <- kl
            senao
               se (c = 5) entao
                  A[2,2] <- kl
               senao
                  se (c = 6) entao
                     A[2,3] <- kl
                  senao
                     se (c = 7) entao
                        A[3,1] <- kl
                     senao
                        se (c = 8) entao
                           A[3,2] <- kl
                        senao
                           se (c = 9) entao
                              A[3,3] <- kl
                           fimse
                        fimse
                     fimse
                  fimse
               fimse
            fimse
         fimse
      fimse
   fimse

fimprocedimento

procedimento vencedor ()
inicio

   se (joga_vez = jg1) entao
      kl <- "X"
      player_nome <- jg1
   senao
      se (joga_vez = jg2) entao
         kl <- "O"
         player_nome <- jg2
      fimse
   fimse

   se (A[1,1] = kl) e (A[2,1] = kl) e (A[3,1] = kl) ou (A[1,2] = kl) e (A[2,2] = kl) e (A[3,2] = kl) entao
      venced <- verdadeiro
      partidas_jogadas <- partidas_jogadas + 1
      nome_vencedor <- player_nome
   senao
      se (A[1,3] = kl) e (A[2,3] = kl) e (A[3,3] = kl) ou (A[1,1] = kl) e (A[1,2] = kl) e (A[1,3] = kl) entao
         venced <- verdadeiro
         partidas_jogadas <- partidas_jogadas + 1
         nome_vencedor <- player_nome
      senao
         se (A[2,1] = kl) e (A[2,2] = kl) e (A[2,3] = kl) ou (A[3,1] = kl) e (A[3,2] = kl) e (A[3,3] = kl) entao
            venced <- verdadeiro
            partidas_jogadas <- partidas_jogadas + 1
            nome_vencedor <- player_nome
         senao
            se (A[1,1] = kl) e (A[2,2] = kl) e (A[3,3] = kl) ou (A[1,3] = kl) e (A[2,2] = kl) e (A[3,1] = kl) entao
               venced <- verdadeiro
               partidas_jogadas <- partidas_jogadas + 1
               nome_vencedor <- player_nome
            fimse
         fimse
      fimse
   fimse
   //Essa condição é atendida caso um jogador vença
   se (venced = verdadeiro) entao
      limpatela
      letreiro
      exibir_velha
      escreval(nome_vencedor," VENCEU!!! - Ganhou 100 PONTOS.")
      pergunta
      zerando_tudo
      //Aplicando a pontuação ao jogador vencedor
      para i de 1 ate k faca
         se (nome_vencedor = R[i].nome) entao
            R[i].pontuacao <- R[i].pontuacao + 100
         fimse
      fimpara
   fimse
fimprocedimento

procedimento exibir_velha ()
inicio
   escreval("                       R O D A D A  N°",terminar             )
   escreval("")
   escreva("                       ":25,A[1,1],"|":3, A[1,2],"|":3, A[1,3])
   escreval("")
   escreval("                       -------------")
   escreva("                       ":25,A[2,1],"|":3, A[2,2],"|":3, A[2,3])
   escreval("")
   escreval("                       -------------")
   escreva("                       ":25,A[3,1],"|":3, A[3,2],"|":3, A[3,3])
   escreval("")
   escreval("")

fimprocedimento

procedimento menu ()
inicio
   venced <- falso  //Se o usuário começou a jogar, ele só retorna ao menu quando ojogo termina, entao precisamos fazer a variavel VENCED voltar a ser falsa, para quando ser iniciado um novo jogo.
   limpatela
   escreval("   ___                         _                   _ _           ")
   escreval("  |_  |                       | |                 | | |          ")
   escreval("    | | ___   __ _  ___     __| | __ _  __   _____| | |__   __ _ ")
   escreval("    | |/ _ \ / _` |/ _ \   / _` |/ _` | \ \ / / _ \ | '_ \ / _` |")
   escreval("/\__/ / (_) | (_| | (_) | | (_| | (_| |  \ V /  __/ | | | | (_| |")
   escreval("\____/ \___/ \__, |\___/   \__,_|\__,_|   \_/ \___|_|_| |_|\__,_|")
   escreval("              __/ |                                              ")
   escreval("             |___/                                               ")
   escreval("")
   escreval("")
   escreval("                E S C O L H A   U M A   O P Ç Ã O:               ")
   escreval("")
   escreval("                       1) Definir PLAYES                         ")
   escreval("                       2) Selecionar PLAYES                      ")
   escreval("                       3) Jogar                                  ")
   escreval("                       4) Score                                  ")
   escreval("                       5) Instruções                             ")
   escreval("                       6) Finalizar                              ")
   leia(opcao)
fimprocedimento

procedimento letreiro ()
inicio
   limpatela
   escreval("   ___                         _                   _ _         ")
   escreval("  |_  |                       | |                 | | |          ")
   escreval("    | | ___   __ _  ___     __| | __ _  __   _____| | |__   __ _ ")
   escreval("    | |/ _ \ / _` |/ _ \   / _` |/ _` | \ \ / / _ \ | '_ \ / _` |")
   escreval("/\__/ / (_) | (_| | (_) | | (_| | (_| |  \ V /  __/ | | | | (_| |")
   escreval("\____/ \___/ \__, |\___/   \__,_|\__,_|   \_/ \___|_|_| |_|\__,_|")
   escreval("              __/ |                                              ")
   escreval("             |___/                                               ")
   escreval("")
fimprocedimento

procedimento jogar ()  //Tabuleiro
inicio

   se (situacao = falso) entao    //Se não tiver cadastrado jogadores, não é possível jogar
      escreval("Cadastre ao menos 2 PLAYES para poder jogar.")
      pergunta
   senao
      se (playes_select = falso) entao  // Caso não tenha decidido quem é o player 1 e o 2, não é possível jogar.
         escreval("Selecione os PLAYES")
         pergunta
         selecionar_jogadores  // Já é direcionado direto para o procedimento de seleção de playes
      senao
         //Se a condição de vencedor não tiver sido atendida continuará o jogo e se terminar for menor ou igual a 9
         enquanto (venced = falso) e (terminar <= 9) faca
            terminar <- terminar + 1 //Essa variavel é somanda sempre que um player joga, para termos o controle e sabemos quando o jogo termina em empate
            se (venced = falso) e (terminar <= 9) entao
               letreiro
               exibir_velha
               joga_vez <- jg1
               repita  //Repita 1 para controlar a entrada de dados, não sendo permitido digitar uma posição menor que 1 ou maior que 9
                  escreva(jg1,"| X | Selecione UMA posição: ")
                  leia(c)
                  se (c < 1) ou (c > 9) entao
                     escreval("Posição inexistente. Tente de 1 a 9")
                     resp <- "n"
                  senao
                     resp <- "s"
                  fimse
               ate (resp = "s") //Fim do Repita 1

               repita  //Repita caso o usuário digite uma posição já ocupada.
                  se (c = B[c]) entao
                     limpatela
                     letreiro
                     exibir_velha
                     escreval("Posição já ocupada.")

                     repita  //Controle entrada de dados
                        escreva(jg1,"| X | Selecione UMA posição: ")
                        leia(c)

                        se (c < 1) ou (c > 9) entao
                           escreval("Posição inexistente. Tente de 1 a 9")
                           resp <- "n"
                        senao
                           resp <- "s"
                        fimse
                     ate (resp = "s")  //Fim Controle de dados.
                  fimse
               ate (c <> b[c])  //Ate o usuário digitar uma posição que não tenha sido ocupada

               B[c] <- c  //Atribuindo a posição que o usuário digitou ao vetor

               v1  // Procedimento que verifica sempre se o JOGADOR 1, conseguiu vencer o jogo
               vencedor //Caso o procedimento v1 passe a da a variavel VENCED VERDADEIRO, esse procedimento encerrará o jogo.
               escreval("")
            fimse

            //Aqui é a parte do PLAYER 2, todas as funcionalidades do 1, são repetidas aqui
            terminar <- terminar + 1
            se (venced = falso) e (terminar <= 9) entao
               letreiro
               exibir_velha
               joga_vez <- jg2
               escreval("")
               repita
                  escreva(jg2,"| O | Selecione UMA posição: ")
                  leia(c)
                  se (c < 1) ou (c > 9) entao
                     escreval("Posição inexistente. Tente de 1 a 9")
                     resp <- "n"
                  senao
                     resp <- "s"
                  fimse
               ate (resp = "s")

               repita
                  se (c = B[c]) entao
                     limpatela
                     letreiro
                     exibir_velha
                     escreval("Posição já ocupada.")
                     repita
                        escreva(jg2,"| O | Selecione UMA posição: ")
                        leia(c)

                        se (c < 1) ou (c > 9) entao
                           escreval("Posição inexistente. Tente de 1 a 9")
                           resp <- "n"
                        senao
                           resp <- "s"
                        fimse
                     ate (resp = "s")
                  fimse
               ate (c <> b[c])

               B[c] <- c

               v1  //Aqui a verificação é no V2, por se tratar obviamente do PLAYER 2
               vencedor
               escreval("")
            fimse
         fimenquanto
      fimse
   fimse
   //Caso o jogo termine em EMPATE
   se (terminar >= 9) entao
      escreval("Deu empate.")
      zerando_tudo
      pergunta
   fimse
fimprocedimento

procedimento zerando_tudo ()
inicio
   //Zerando a MATRIZ (Tabuleiro)
   A[1,1] <- "1"
   A[1,2] <- "2"
   A[1,3] <- "3"
   A[2,1] <- "4"
   A[2,2] <- "5"
   A[2,3] <- "6"
   A[3,1] <- "7"
   A[3,2] <- "8"
   A[3,3] <- "9"
   //Zerando a VETOR (Posições)
   B[1] <- 0
   B[2] <- 0
   B[3] <- 0
   B[4] <- 0
   B[5] <- 0
   B[6] <- 0
   B[7] <- 0
   B[8] <- 0
   B[9] <- 0
   //Zerando o contador do EMPATE.
   terminar <- 0
fimprocedimento

procedimento definir_playes ()
inicio
   situacao <- verdadeiro   //Só por ter entrado no procedimento, já se torna verdadeira, o algoritmo entende que cadastrou 2 playes.
   limpatela
   repita
      letreiro
      k <- k + 1
      escreval("===========================")
      escreval("    Definindo PLAYES    ")
      escreval("===========================")

      escreval("")
      escreva("Digite o NOME do",k,"° JOGADOR: ")
      leia(R[K].nome)
      escreva("Digite a IDADE do",k,"° JOGADOR: ")
      leia(R[K].idade)

      se (ao_menos_dois_playes = falso) entao
         k <- k + 1
         escreval("")
         escreva("Digite o NOME do",k,"° JOGADOR: ")
         leia(R[K].nome)
         escreva("Digite a IDADE do",k,"° JOGADOR: ")
         leia(R[K].idade)
         ao_menos_dois_playes <- verdadeiro
      fimse

      escreval("")
      escreval("Cadastrar mais um PLAYER? [S/N]")
      leia(resp)
   ate (resp = "N") ou (resp = "n")
   pergunta

fimprocedimento

procedimento selecionar_jogadores ()
inicio
   playes_select <- verdadeiro
   limpatela
   letreiro
   escreval("============================")
   escreval("        JOGADORES           ")
   escreval("============================")
   escreval("")

   se (situacao = falso) entao
      escreval("Cadastre PLAYES para poder SELECIONAR.")
   senao
      //Exibindo os PLAYES cadastrados.
      para j de 1 ate k faca
         escreval(j,"° JOGADOR ",R[j].nome," | Idade",R[j].idade)
      fimpara
      escreval("")

      repita
         escreval("Quem vai ser o PLAYER 1? - X ")
         leia(nome)

         //Verificando se tem algum PLAYER com o nome digitado.
         para j de 1 ate k faca
            se (nome = R[j].nome) entao
               escreval("Jogador selecionado: ",R[j].nome)
               jg1 <- R[j].nome
               continuar <- "sim"
               interrompa
            senao
               continuar <- "nao"
            fimse
         fimpara
      ate (continuar = "sim")

      escreval("")

      repita
         escreval("Quem vai ser o PLAYER 2? - O ")
         leia(nome)

         para j de 1 ate k faca
            se (nome = R[j].nome) entao
               escreval("Jogador selecionado: ",R[j].nome)
               jg2 <- R[j].nome
               continuar <- "sim"
               interrompa
            senao
               continuar <- "nao"
            fimse
         fimpara

      ate (continuar = "sim")
   fimse
   pergunta

fimprocedimento

procedimento pergunta () //Como existem vários limpatela, procedimento para exibir as informações na tela do usuário até ele apertar qualquer tecla.
inicio
   escreval("=====================")
   escreval("Aperte qualquer tecla")
   escreval("=====================")
   leia(ap)
fimprocedimento

Inicio
   //Toda a MATRIZ, é preenchida de 1 a 9, para a exibição no TABULEIRO, e facilitar a jogatina.
   A[1,1] <- "1"
   A[1,2] <- "2"
   A[1,3] <- "3"
   A[2,1] <- "4"
   A[2,2] <- "5"
   A[2,3] <- "6"
   A[3,1] <- "7"
   A[3,2] <- "8"
   A[3,3] <- "9"
   repita
      menu
      escolha (opcao)

      caso 1
         definir_playes

      caso 2
         selecionar_jogadores

      caso 3
         jogar

      caso 4
         limpatela
         letreiro
         se (situacao = falso) entao

            escreval("Não há score disponível")
         senao
            //Ordenando a pontuação do maior para o menor
            para i de 1 ate k-1 faca
               para j de i+1 ate k faca
                  se (R[i].pontuacao < R[j].pontuacao) entao
                     aux <- R[i].pontuacao
                     R[i].pontuacao <- R[j].pontuacao
                     R[j].pontuacao  <- aux

                     //Ordenando nomes também
                     aux_nome <- R[i].nome
                     R[i].nome <- R[j].nome
                     R[j].nome <- aux_nome

                     //Ordenando Idade também
                     aux_idade <- R[i].idade
                     R[i].idade <- R[j].idade
                     R[j].idade <- aux_idade
                  fimse
               fimpara
            fimpara
            escreval("")
            escreval("O total de partidas jogadas foram: ",partidas_jogadas)
            para i de 1 ate k faca
               escreval(R[i].nome," ",R[i].pontuacao," pontos.")
            fimpara

         fimse
         pergunta
      caso 5
         letreiro
         escreval("Duas pessoas jogam alternadamente, preenchendo cada um dos espaços vazios.")
         escreval("Tradicionalmente se faz com X e O como elementos para a marcação.")
         escreval("Cada participante deve usar um símbolo (X ou O).")
         escreval("Vence o jogador que conseguir formar primeiro uma linha com três símbolos iguais")
         escreval("Seja ela na horizontal, vertical ou diagonal.")
         escreval("")
         escreval("Cada partida vale 100 pontos, sendo assim. O vencedor ganha 100 pontos, o jogador perdedor não ganha nenhum ponto.")
         pergunta
      caso 6
         escreval("Saindo do jogo...")
         continuar <- "PARE"

      outrocaso
         escreval("Opção inválida.")
         pergunta
      fimescolha

   ate (continuar = "PARE")

Fimalgoritmo