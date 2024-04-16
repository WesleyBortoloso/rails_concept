class Surveys::V1 < Grape::API
  version 'v1', using: :path

  resource :survey do
    desc 'Retorna todas as enquetes'
    get do
      Survey.all
    end

    desc 'Retorna uma enquete específica'
    params do
      requires :id, type: Integer, desc: 'ID da enquete'
    end
    get ':id' do
      survey = Survey.find(params[:id])
      survey.as_json(include: :votes)
    end

    desc 'Cria uma nova enquete'
    params do
      requires :question, type: String, desc: 'Pergunta da enquete'
    end
    post do
      Survey.create!(question: params[:question])
    end
  end
end
