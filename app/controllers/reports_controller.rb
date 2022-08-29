class ReportsController < ApplicationController
  before_action :set_report, only: %i[ show edit update destroy ]

  def index
    @reports = Report.all.order(:id).page(params[:page])
  end

  def show
    @report = Report.find(params[:id])
    @comment = @report.comments.build
  end

  def new
    @report = Report.new
  end

  def edit
  end

  def create
    @report = current_user.reports.new(report_params)

    respond_to do |format|
      if @report.save
        redirect_to report_url(@report), notice: "Report was successfully created." 
      else
        render :new, status: :unprocessable_entity 
      end
    end
  end

  def update
    respond_to do |format|
      if @report.update(report_params)
        redirect_to report_url(@report), notice: "Report was successfully updated." 
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @report.destroy

    respond_to do |format|
      redirect_to reports_url, notice: "Report was successfully destroyed." 
    end
  end

  private
    def set_report
      @report = Report.find(params[:id])
    end

    def report_params
      params.require(:report).permit(:title, :contents)
    end

    def set_commentable
      @commentable = Report.find(params[:report_id])
    end
end
