<?php
include_once("includes/conexao.php");

$idProfessor = 0;
$nome = "";
$email = "";
$telefone = "";
$disciplina = "";
$titularidade = "";
$dataContratacao = date('Y-m-d');



if ($_POST) {

    $idProfessor = $_POST['idProfessor'];
    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $telefone = $_POST['telefone'];
    $disciplina = $_POST['disciplina'];
    $titularidade = $_POST['titularidade'];
    $dataContratacao = $_POST['dataContratacao'];

    // // Converte de dd-mm-aaaa para yyyy-mm-dd antes de salvar no banco
    // if (!empty($dataContratacao)) {
    //     $partesData = explode('-', $dataContratacao);
    //     if (count($partesData) === 3) {
    //         $dataContratacao = $partesData[2] . '-' . $partesData[1] . '-' . $partesData[0];
    //     }
    // }

    if ($idProfessor == 0) {
        // Vamos fazer a verificacao antes de inserir se ja existe um usuario com o mesmo nome
        $sql = "SELECT * FROM professores WHERE nome = '$nome'";
        $resultado = mysqli_query($conexao, $sql);
        if (mysqli_num_rows($resultado) > 0) { //Busca a quantidade de linhas do SELECT
            header("Location: professor.php?tipoMsg=erro&msg=Já existe um aluno com esse nome!");
            exit();
        } else {
            //prepara a variavel para a insercao no banco de dados
            $sql = "insert into professores (nome, email, telefone, disciplina, titularidade, dataContratacao) values ('$nome', '$email', '$telefone', '$disciplina', '$titularidade', '$dataContratacao')";

            //Verificamos se a insercao no banco de dados ocorreu correntamente ou nao
            if (mysqli_query($conexao, $sql)) {
                header("Location: professor.php?tipoMsg=sucesso&msg=O professor <strong>$nome</strong> foi incluído com sucesso!");
            } else {
                header("Location: professor.php?tipoMsg=erro&msg=Erro ao inserir o professor! Erro: " . mysqli_error($conexao));
            }
        }
    } else {
        $sql = "UPDATE professores SET nome = '$nome', email = '$email', telefone = '$telefone', disciplina = '$disciplina', titularidade='$titularidade', dataContratacao='$dataContratacao' WHERE idProfessor = '{$idProfessor}'";
        if (mysqli_query($conexao, $sql)) {
            header("Location: professor.php?tipoMsg=sucesso&msg=O professor <b>$nome</b> foi atualizado com sucesso!");
        } else {
            header("Location: professor.php?tipoMsg=erro&msg=Erro ao atualizar cadastro!");
        }
    }
}

if (isset($_GET['idProfessor'])) {

    $idProfessor = $_GET['idProfessor'];

    if (isset($_GET['acao'])) {
        $sql = "DELETE FROM professores WHERE idProfessor = '{$idProfessor}'";

        if (mysqli_query($conexao, $sql)) {
            header("Location: professor.php?tipoMsg=sucesso&msg=O professor <b>$nome</b> foi excluido com sucesso!");
        } else {
            header("Location: professor.php?tipoMsg=erro&msg=Erro ao excluir cadastro!");
        }
    }



    // Valida se o valor é numérico
    if (!is_numeric($idProfessor)) {
        die("ID de aluno inválido.");
    }

    // Prepara a consulta protegida contra SQL Injection
    $stmt = mysqli_prepare($conexao, "SELECT * FROM professores WHERE idProfessor = ?");
    mysqli_stmt_bind_param($stmt, "i", $idProfessor);
    mysqli_stmt_execute($stmt);
    $resultado = mysqli_stmt_get_result($stmt);

    // $sql = "SELECT * FROM professores WHERE idProfessor = '{$idProfessor}'";
    // $resultado = mysqli_query($conexao, $sql);

    //associar a variavel resultado a uma variavel consultavel;
    $row = mysqli_fetch_assoc($resultado);

    $idProfessor = $row['idProfessor'];
    $nome = $row['nome'];
    $email = $row['email'];
    $telefone = $row['telefone'];
    $disciplina = $row['disciplina'];
    $titularidade = $row['titularidade'];
    $dataContratacao = $row['dataContratacao'];

    if (!empty($dataContratacao)) {
        $dataContratacao = date('d-m-Y', strtotime($dataContratacao));
    }
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">

    <title>Cadastro de professores</title>
</head>

<body>
    <!-- NavBar Padrão vindo de includes/menu -->
    <?php include_once("includes/menu.php"); ?>
    <div class="container">
        <div class="card mb-3">
            <div class="card-body">
                <form method="POST" action="" class="row g-3 needs-validation p-3" novalidate>
                    <input type="hidden" name="idProfessor" value="<?php echo $idProfessor; ?>">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="nomeProfessor" class="form-label mt-2">Nome: </label>
                            <input type="text" value="<?php echo $nome ?>" name="nome" class="form-control" placeholder="Informe o nome do professor">
                        </div>
                        <div class="col-md-6">
                            <label for="emailProfessor" class="form-label mt-2">Email: </label>
                            <input type="email" value="<?php echo $email ?>" name="email" class="form-control" placeholder="Informe o e-mail do professor">
                        </div>
                        <div class="col-md-6">
                            <label for="telefoneProfessor" class="form-label mt-2">Telefone: </label>
                            <input type="text" value="<?php echo $telefone ?>" name="telefone" class="form-control" placeholder="Informe o telefone do professor">
                        </div>
                        <div class="col-md-6">
                            <label for="disciplinaProfessor" class="form-label mt-2">Nome do disciplina: </label>
                            <input type="text" value="<?php echo $disciplina ?>" name="disciplina" class="form-control" placeholder="Informe o nome do disciplina">
                        </div>
                        <div class="col-md-6">
                            <label for="titularidadeProfessor" class="form-label mt-2">Titularidade: </label>
                            <select name="titularidade" class="form-control">
                                <option value="">Selecione a titularidade</option>
                                <option value="Graduado" <?php if ($titularidade == 'Graduado') echo 'selected'; ?>>Graduado</option>
                                <option value="Especialista" <?php if ($titularidade == 'Especialista') echo 'selected'; ?>>Especialista</option>
                                <option value="Mestre" <?php if ($titularidade == 'Mestre') echo 'selected'; ?>>Mestre</option>
                                <option value="Doutor" <?php if ($titularidade == 'Doutor') echo 'selected'; ?>>Doutor</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="nomedisciplinaAluno" class="form-label mt-2">Data da Contratação: </label>
                            <input type="date" value="<?php echo $dataContratacao ?>" name="dataContratacao" class="form-control" placeholder="Informe a data da contratação (dd-mm-aaaa)">
                        </div>
                    </div>
                    <div class="col-12">
                        <button class="btn btn-success" type="submit">Enviar</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- Retorno de includes/mensagem -->
        <?php include_once("includes/mensagens.php"); ?>
        <div class="card mt-3 mb-2">
            <div class="card-body">
                <table class="table table-bordered">
                    <tr>
                        <th>ID Professor</th>
                        <th>Nome</th>
                        <th>E-MAIL</th>
                        <th>Telefone</th>
                        <th>Disciplina</th>
                        <th>Titularidade</th>
                        <th>Contratação</th>
                        <th>Ações</th>

                    </tr>

                    <?php
                    $sql = "SELECT * FROM professores ORDER BY nome ASC";
                    $resultado = mysqli_query($conexao, $sql);
                    
                    while ($row = mysqli_fetch_assoc($resultado)) {
                        
                        echo "
                        <tr>
                            <td>" . $row['idProfessor'] . "</td>
                            <td>" . $row['nome'] . "</td>
                            <td>" . $row['email'] . "</td>
                            <td>" . $row['telefone'] . "</td>
                            <td>" . $row['disciplina'] . "</td>
                            <td>" . $row['titularidade'] . "</td>
                            <td>" . date('d-m-Y', strtotime($row['dataContratacao'])) . "</td>
                             <td>
                                <a href='?idProfessor=" . $row['idProfessor'] . "' class='btn btn-primary btn-sm'>Editar</a> 
                                <a href='?idProfessor=" . $row['idProfessor'] . "&acao=excluir' class='btn btn-danger btn-sm'>Excluir</a>
                            </td>
                            

                        </tr>
                        ";
                    }

                    ?>
                </table>
            </div>
        </div>
    </div>
</body>

</html>