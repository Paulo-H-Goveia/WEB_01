package model;

public class tarefas {
	private String id;
    private String titulo;
    private String descricao;
    private String dataCriacao;
    private String dataConclusao;
    private String status;
    
    public tarefas(String id,String titulo, String descricao, String dataCriacao, String dataConclusao, String status) {
    	this.id = id;
    	this.titulo = titulo;
        this.descricao = descricao;
        this.dataCriacao = dataCriacao;
        this.dataConclusao = dataConclusao;
        this.status = status;
    }
    public String getId() {
        return id;
    }
    
    public void setId(String id) {
        this.titulo = id;
    }
    
    public String getTitulo() {
        return titulo;
    }
    
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    
    public String getDescricao() {
        return descricao;
    }
    
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    public String getDataCriacao() {
        return dataCriacao;
    }
    
    public void setDataCriacao(String dataCriacao) {
        this.dataCriacao = dataCriacao;
    }
    
    public String getDataConclusao() {
        return dataConclusao;
    }
    
    public void setDataConclusao(String dataConclusao) {
        this.dataConclusao = dataConclusao;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
}

