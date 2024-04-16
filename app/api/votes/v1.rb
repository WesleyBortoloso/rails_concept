class Votes::V1 < Grape::API
  version 'v1', using: :path

  resource :votes do
    desc 'Cria um voto'
    params do
      requires :option, type: String, desc: 'Opção do voto'
      requires :survey_id, type: Integer, desc: 'ID da enquete'
    end
    post do
      survey = Survey.find(params[:survey_id])
      vote = survey.votes.build(option: params[:option])
      if vote.save
        status :created
      else
        error!('Erro ao criar o voto', 422)
      end
    end
  end
end
