class ResumesController < ApplicationController
  def create
    @resume = current_user.resumes.build(resume_params)
    if @resume.save                                                          #resumeを保存
      flash[:success] = "Resume created!"                                    #flashに成功メッセージ
      redirect_to root_url                                                      #rootにリダイレクト
    else                                                                        #保存できなかった場合
      #@resume = current_user.resumes.build
      render 'pages/home'                                                #homeアクションでrender
    end
  end


  private
    def resume_params
      params.require(:resume).permit(:job_type, :location, :desired_salary, :timing, :age, 
                                    :skills, :capacity, :languages, :employment_pattern, :note)
    end
end
