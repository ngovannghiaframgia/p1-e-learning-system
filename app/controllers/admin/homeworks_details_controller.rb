class Admin::HomeworksDetailsController < Admin::AdminBaseController
  def create
    homeworks_detail = HomeworksDetail.new homework_id: params[:homework_id], exercise_id: params[:exercise_id]
    homeworks_detail.save!
    respond_to do |format|
      format.json { render :json => homeworks_detail }
    end
  end

  def destroy
    homeworks_detail = HomeworksDetail.find_by id: params[:id]
    homeworks_detail.destroy!
    respond_to do |format|
      format.json { render :json => homeworks_detail }
    end
  end
end
