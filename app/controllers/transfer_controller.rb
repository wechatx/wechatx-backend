class TransferController < ApplicationController
  def index
    from = params[:from] || 1
    to = params[:to] || 1000
    result = Scan.all[from-1,to]
    render json: {:status => 'success',:result => result},callback: params[:callback]
  end

  def create
    id = params[:_id]
    openid = params[:_openid]
    time = params[:time]
    charSet = params[:charSet]
    rawData = params[:rawData]
    result = params[:result]
    scanType = params[:scanType]
    accuracy = params[:accuracy]
    lat = params[:lat]
    lng = params[:lng]
    if id.length >=0 && Scan.where(:_id => id).length == 0
      Scan.create(:_id => id,:_openid => openid,:time => time,:charSet => charSet,:rawData => rawData,
                               :result => result,:scanType => scanType,:accuracy => accuracy,:lat => lat,:lng => lng)
      render json: {:satus => "success"},callback: params['callback']
    else
      render json: {:status => "error"},callback: params['callback']
    end
  end

  def update
    id = params[:_id]
    openid = params[:_openid]
    time = params[:time]
    charSet = params[:charSet]
    rawData = params[:rawData]
    result = params[:result]
    scanType = params[:scanType]
    accuracy = params[:accuracy]
    lat = params[:lat]
    lng = params[:lng]
    if id.length >=0 && Scan.where(:_id => id).length >= 0
      Scan.update(:_id => id,:_openid => openid,:time => time,:charSet => charSet,:rawData => rawData,
                  :result => result,:scanType => scanType,:accuracy => accuracy,:lat => lat,:lng => lng)
      render json: {:status => "success"},callback: params['callback']
    else
      render json: {:status => "error"},callback: params['callback']
    end
  end

  def delete
    id = params[:_id]
    if id.length >=0 && Scan.where(:_id => id).length >= 0
      scan = Scan.find(id)
      scan.destroy
      render json: {:status => "success"},callback: params['callback']
    else
      render json: {:status => "error"},callback: params['callback']
      end
  end

  def destroy
    Scan.delete_all
    render json: {:status => "success"},callback: params['callback']
  end
end
