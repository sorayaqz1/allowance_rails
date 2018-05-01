class MoneyrecordsController < ApplicationController
  def index
    @moneyrecords = Moneyrecord.all
  end

  def new
    @moneyrecord = Moneyrecord.new
  end

  def show
    @moneyrecord = Moneyrecord.find(params[:id])
  end

  def create
    @moneyrecord = Moneyrecord.new(record_params)

    if @moneyrecord.save
      flash[:notice] = "Successfully Saved the record"
      redirect_to moneyrecord_path(@moneyrecord)
    else
      puts "not able to save ----------------------"
      puts @moneyrecord.errors.full_messages
      render 'new' # or :new
    end
    puts Moneyrecord.all
  end

  def edit
    @moneyrecord = Moneyrecord.find(params[:id])
  end

  def update
    @moneyrecord = Moneyrecord.find(params[:id])
    if @moneyrecord.update(record_params)

      flash[:notice] = "You have Successfully update the record"
      redirect_to moneyrecord_path(@moneyrecord)
    else
      puts "not able to udate"
      puts @moneyrecord.errors.full_messages
      render 'edit'
    end
  end

  # def destroy
  #   @moneyrecord = Moneyrecord.find(params[:id])
  #   @moneyrecord.destroy
  #   flash[:notice] = "Money record has Successfully deleted"
  #   redirect_to moneyrecords_path
  # end

  private

  def record_params
    params.require(:moneyrecord).permit(:date, :desc, :amount, :total)
  end

end
