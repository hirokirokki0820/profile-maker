class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]
  before_action :set_post

  # GET /profiles or /profiles.json
  def index
    @profiles = @post.profiles
  end

  # GET /profiles/1 or /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.post = @post
    if @profile.save
      redirect_to @profile.post
      flash.now.notice = "景品が１件追加されました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    if @profile.update(profile_params)
      redirect_to post_profile_path(@profile.post_id, @profile.id), notice: "アイテムが更新されました"
      flash.now.notice = "プロフィールが更新されました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @profile.destroy
    redirect_to post_path(@post), notice: "プロフィールが削除されました", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:name, :gender, :birthday, :blood_type, :personality, :hobby, :speciality, :answer1, :answer2, :answer3, :answer4, :answer5)
    end
end
