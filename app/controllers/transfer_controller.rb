class TransferController < ApplicationController
  def index
    from = params[:from] || 1
    to = params[:to] || 1000
    result = Scan.all[from-1,to]
    render json: {:status => 'success',:result => result},callback: params[:callback]
  end

  def create
    openid = params[:_openid]
    time = params[:time]
    rawData = params[:rawData]
    result = params[:result]
    alt = params[:alt]
    lat = params[:lat]
    lng = params[:lng]
    if openid && Scan.where(:_openid => openid).length == 0
      Scan.create(:_openid => openid,:time => time,:rawData => rawData, :result => result,
                  :alt => alt,:lat => lat,:lng => lng)
      render json: {:status => "success",:message => "用户信息创建成功"},callback: params['callback']
    else
      render json: {:status => "error",:message => "用户信息创建失败"},callback: params['callback']
    end
  end

  def update
    id = params[:id]
    openid = params[:_openid]
    time = params[:time]
    rawData = params[:rawData]
    result = params[:result]
    alt = params[:alt]
    lat = params[:lat]
    lng = params[:lng]
    if id.length >=0 && Scan.where(:id => id).length >= 0
      Scan.update(:id => id,:_openid => openid,:time => time,:rawData => rawData, :result => result,
                  :alt => alt,:lat => lat,:lng => lng)
      render json: {:status => "success",:message => "用户信息更新成功"},callback: params['callback']
    else
      render json: {:status => "error",:message => "用户信息更新失败"},callback: params['callback']
    end
  end

  def delete
    id = params[:id]
    if id.length >=0 && Scan.where(:id => id).length > 0
      scan = Scan.find(id)
      scan.destroy
      render json: {:status => "success"},callback: params['callback']
    else
      render json: {:status => "error",:message => "该用户不存在"},callback: params['callback']
    end
  end

  def destroy
    Scan.delete_all
    render json: {:status => "success"},callback: params['callback']
  end
end
