<?php
include_once("includes/conexao.php");

if ($_POST) {

    $data = date("Y-m-d");
    $idAluno = $_POST['idAluno'];
    $idProfessor = $_POST['idProfessor'];
    $idTurma = $_POST['idTurma'];


    $sql = "INSERT INTO matriculas(data, idAluno, idProfessor, idTurma)
            VALUES ('$data', '$idAluno', '$idProfessor', '$idTurma')";


    //Verificamos se a insercao no banco de dados ocorreu correntamente ou nao
    if (mysqli_query($conexao, $sql)) {
        header("Location: matricula.php?tipoMsg=sucesso&msg=A Turma <strong>$nome</strong> foi incluída com sucesso!");
    } else {
        header("Location: matricula.php?tipoMsg=erro&msg=Erro ao inserir o Turma! Erro: " . mysqli_error($conexao));
    }
}


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">

    <title>Matricula de Alunos</title>
</head>

<body>
    <!-- NavBar Padrão vindo de includes/menu -->
    <?php include_once("includes/menu.php"); ?>
    <div class="container">
        <div class="card mb-3">
            <div class="card-body">
                <form method="POST" action="">
                    <div class="row">
                        <div class="col-md-4">
                            <label for="">Alunos</label>
                            <select name='idAluno' class="form-select">
                                <?php
                                $sql = "SELECT * FROM alunos ORDER BY nome ASC";
                                $resultado = mysqli_query($conexao, $sql);
                                while ($row = mysqli_fetch_assoc($resultado)) {
                                    echo "<option value='" . $row['idAluno'] . "'>" . $row['nome'] . "</option>";
                                }
                                ?>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="">Professores</label>
                            <select name='idProfessor' class="form-select">
                                <?php
                                $sql = "SELECT * FROM professores ORDER BY nome ASC";
                                $resultado = mysqli_query($conexao, $sql);
                                while ($row = mysqli_fetch_assoc($resultado)) {
                                    echo "<option value='" . $row['idProfessor'] . "'>" . $row['nome'] . " - " . $row['disciplina'] . "</option>";
                                }
                                ?>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="">Turma</label>
                            <select name='idTurma' class="form-select">
                                <?php
                                $sql = "SELECT * FROM turmas ORDER BY nome ASC";
                                $resultado = mysqli_query($conexao, $sql);
                                while ($row = mysqli_fetch_assoc($resultado)) {
                                    echo "<option value='" . $row['idTurma'] . "'>" . $row['nome']  . "</option>";
                                }
                                ?>
                            </select>
                        </div>

                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <button class="btn btn-primary">Salvar</button>
                        </div>
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
                        <th>Data</th>
                        <th>Aluno</th>
                        <th>Professor</th>
                        <th>Turma</th>
                        <th>Disciplina</th>
                        <th>Ações</th>
                    </tr>

                    <?php
                    $sql = "SELECT m.idMatricula, m.data, 
                                   a.nome AS nomeAluno, 
                                   p.nome AS nomeProfessor, 
                                   p.disciplina, 
                                   t.nome AS nomeTurma
                            FROM matriculas m
                            JOIN alunos a ON m.idAluno = a.idAluno
                            JOIN professores p ON m.idProfessor = p.idProfessor
                            JOIN turmas t ON m.idTurma = t.idTurma
                            ORDER BY m.data DESC";

                    $resultado = mysqli_query($conexao, $sql);

                    while ($row = mysqli_fetch_assoc($resultado)) {
                        echo "
                        <tr>
                            <td>" . date('d-m-Y', strtotime($row['data'])) . "</td>
                            <td>" . $row['nomeAluno'] . "</td>
                            <td>" . $row['nomeProfessor'] . "</td>
                            <td>" . $row['nomeTurma'] . "</td>
                            <td>" . $row['disciplina'] . "</td>
                            <td>
                                <a href='?idMatricula=" . $row['idMatricula'] . "' class='btn btn-primary btn-sm'>Editar</a> 
                                <a href='?idMatricula=" . $row['idMatricula'] . "&acao=excluir' class='btn btn-danger btn-sm'>Excluir</a>
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