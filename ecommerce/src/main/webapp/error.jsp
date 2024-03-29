<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

                <head>
                    <meta charset="utf-8">
                    <title>Projeto LES 2023 - E-Commerce</title>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <meta name="description" content="">
                    <!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
                    <!-- bootstrap -->
                    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                    <link href="static/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
                    <link href="static/themes/css/bootstrappage.css" rel="stylesheet" />

                    <!-- global styles -->
                    <link href="static/themes/css/flexslider.css" rel="stylesheet" />
                    <link href="static/themes/css/main.css" rel="stylesheet" />

                    <!-- scripts -->
                    <script src="static/themes/js/jquery-1.7.2.min.js"></script>
                    <script src="static/bootstrap/js/bootstrap.min.js"></script>
                    <script src="static/themes/js/superfish.js"></script>
                    <script src="static/themes/js/jquery.scrolltotop.js"></script>

                </head>
                <style>
                    .mensagem {
                        color: #434e65;
                        width: 50%;
                        margin: auto;
                    }
                    
                    .mensagem-content {
                        padding: 20px;
                        font-size: 16px;
                        border-radius: 5px;
                        border: none;
                        margin-top: 10px;
                    }
                    
                    .mensagem-header {
                        border-bottom: none;
                        position: relative;
                        text-align: center;
                        margin: -20px -20px 0;
                        border-radius: 5px 5px 0 0;
                        padding: 35px;
                    }
                    
                    .mensagem h4 {
                        text-align: center;
                        font-size: 36px;
                        margin: 0 0 25px 0;
                    }
                    
                    .caixa_icone {
                        display: flex;
                        justify-content: center;
                    }
                    
                    .caixa_icone svg {
                        display: block;
                    }
                    
                    .btn a {
                        color: white;
                    }
                </style>

                <body>
                    <div id="top-bar" class="container">
                        <div class="row">
                            <div class="span4">
                                <a href="index.jsp" class="logo pull-left"><img src="static/themes/images/logo_horizontal.png" class="site_logo" alt=""></a>
                                <form method="POST" class="search_form">
                                    <input type="text" class="input-block-level search-query" Placeholder="Pesquisar produto">
                                </form>
                            </div>
                            <div class="span8">
                                <div class="account pull-right">
                                    <ul class="user-menu">
                                        <li><a href="#">Minha conta</a></li>
                                        <li><a href="cart.jsp">Carrinho</a></li>
                                        <li><a href="checkout.jsp">Finalizar Compra</a></li>
                                        <li><a href="login.jsp">Entrar</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="wrapper" class="container">
                        <section class="navbar main-menu">
                            <div class="navbar-inner main-menu">
                                <nav id="menu" class="pull-right">
                                    <ul>
                                        <li><a href="./products.jsp">Mulher</a>
                                            <ul>
                                                <li><a href="./products.jsp">Presentes</a></li>
                                                <li><a href="./products.jsp">Acessórios</a></li>
                                                <li><a href="./products.jsp">Inverno</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="./products.jsp">Homem</a>
                                            <ul>
                                                <li><a href="./products.jsp">Presentes</a></li>
                                                <li><a href="./products.jsp">Acessórios</a></li>
                                                <li><a href="./products.jsp">Inverno</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="./products.jsp">Melhor avaliados</a></li>
                                        <li><a href="./products.jsp">Mais vendidos</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </section>
                        <div class="col-12 container">
                            <div id="mensagem_resposta" class="mensagem">
                                <div class="mensagem-content">
                                    <div class="mensagem-header justify-content-center error">
                                        <div class="caixa_icone" style="color: #f15e5e;">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="128" height="128" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
                                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                            <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                                        </svg>
                                        </div>
                                    </div>
                                    <div class="mensagem-body text-center">
                                        <h4>Desculpe!</h4>
                                        <p>Infelizmente não foi possível realizar o cadastro. Revise os campos</p>
                                        <button class="btn btn-warning"><span><a href="javascript:history.back()">Voltar</span></a></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </body>

                </html>