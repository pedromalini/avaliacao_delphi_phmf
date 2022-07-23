# avaliacao_delphi_phmf
Avalição Delphi XE10.3

O Sistema Consiste em um registro de downloads, o Login fica na tabela DNUSUARIO os campos CODIGO se refere ao Login e o campo USUARIOBD se refere a senha na aplicação.

LOGIN  = 1
SENHA = pedro

A Tabela LOGDOWNLOAD registra os downloads com a data de inicio e termino.

o Projeto Possui 3 PASTAS.

DB - Onde Se encontra o arquivo de banco de dados sem senha, foi utilizado o SQLITE3 com o SGBD SQLiteStudio.

LIB - As Dlls utilizadas para que possa ser feito a conexão https nos donwloads.

WIN32/Debug - Possui o Binario para execução.

Para execução é necessario que a pasta DB e LIB estejam na mesma raiz o executavel, caso não utilize o projeto.

Os Arquivos do Projeto.

Teste_Download.Dpr arquivo principal do projeto, onde todos os formularios são criados incialmente, já que é um projeto pequeno, todos os formularios foram removidos os botoes maximizar, minimizar não teve um intuito especifico para uso dessa opção.

UnLogin - Formulario de Login, onde o codigo verificar se os campos estão vazios, é feita a comparação com os campos usuariobd e codigo, não foi utilizado funções para o encrypt e decrypt da senha no banco de dados.

unBaixar - Formulario onde se encontra o codigo para ser feito o download , com funções de conversão de tamanho e porcetagem de conclusão para que a barra de progresso seja preenchia de acordo com o tamanho do arquivo.
         - Botão Exibir Mensagem Exibe o Progresso em porcentagem de conclusão do Download.
         - Botão Exibir Historico de Downloads exibe o Formulario UnHistorico fazendo a consulta de todos os registros de downloads já efetuado com sucesso.
         - Botão Parar Download para o download a qualquer momento e habilita o Botão Inicio para começar o Download novamente.
         - Botão Fechar Sistema fecha o sistema caso o componente IdHttp não esteja em uso, caso sim ele informa que esta em uso para que o usuario decida se quer realemente parar o Download Atual. 
         - Botão Iniciar Download inicia o Download fazendo inserção no banco de dados caso o download seja iniciado com sucesso, caso não, ou caia no meio da transferencia o registro de log dos downloads não é inserido, antes da inserção é feita a contagem de registros para o campo codigo ser inserido em ordem crescente,o dlgSave é utilizado para informar em qual local o arquivo será salvo, no WorkBegin do componente IdHttp é gravado a data inicio do download, no Work do componente IdHttp é gravado a porcentagem do download e a posição do progressbar conforme o dowload acontece, no WorkEnd do componente IdHttp é feito a gravação da data final na variavel, informa que o Download foi terminado, zera a posição da barra de progresso e habilita novamente o botao iniciar Download.
         - O Componente IdSSLIOHandlerSocketOpenSSL1 é utilizado para fazer a conexão com as DLLS da pasta LIB, com isso é possivel fazer os downloads em paginas https.
       
unComponentes - Formulario onde ficam os componentes de conexão com o arquivo de banco de dados disponibilizado na pasta DB, dependendo da versão do Delphi será solicitado senha do banco de dados onde o mesmo não possui porem é necessario clicar em OK na mensagem do FIREDAC.

Qualquer duvida, melhoria ou Sugestão estou disponivel no email pedromalinifranco@gmail.com, projeto disponibilizado somente para estudo de metodos de utilização.




