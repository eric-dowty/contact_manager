require 'rails_helper'

RSpec.describe PhoneNumbersController, type: :controller do

  let(:valid_attributes) {
    { number: "1112223333", person_id: 1 }
  }

  let(:invalid_attributes) {
    { number: nil, person_id: nil }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all phone_numbers as @phone_numbers" do
      phone_number = PhoneNumber.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:phone_numbers)).to eq([phone_number])
    end
  end

  describe "GET #show" do
    it "assigns the requested phone_number as @phone_number" do
      phone_number = PhoneNumber.create! valid_attributes
      get :show, {:id => phone_number.to_param}, valid_session
      expect(assigns(:phone_number)).to eq(phone_number)
    end
  end

  describe "GET #new" do
    it "assigns a new phone_number as @phone_number" do
      get :new, {}, valid_session
      expect(assigns(:phone_number)).to be_a_new(PhoneNumber)
    end
  end

  describe "GET #edit" do
    it "assigns the requested phone_number as @phone_number" do
      phone_number = PhoneNumber.create! valid_attributes
      get :edit, {:id => phone_number.to_param}, valid_session
      expect(assigns(:phone_number)).to eq(phone_number)
    end
  end

  describe "POST #create" do
    context "with valid params" do

      let(:alice) { Person.create(first_name: 'Alice', last_name: 'Smith') }
      let(:valid_attributes) { {number: '555-1234', person_id: alice.id} }
      it "creates a new PhoneNumber" do
        expect {
          post :create, {:phone_number => valid_attributes}, valid_session
        }.to change(PhoneNumber, :count).by(1)
      end

      it "assigns a newly created phone_number as @phone_number" do
        post :create, {:phone_number => valid_attributes}, valid_session
        expect(assigns(:phone_number)).to be_a(PhoneNumber)
        expect(assigns(:phone_number)).to be_persisted
      end

      it "redirects to the phone number's person" do
        alice = Person.create(first_name: 'Alice', last_name: 'Smith')
        valid_attributes = {number: '555-8888', person_id: alice.id}
        post :create, {:phone_number => valid_attributes}, valid_session
        expect(response).to redirect_to(alice)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved phone_number as @phone_number" do
        post :create, {:phone_number => invalid_attributes}, valid_session
        expect(assigns(:phone_number)).to be_a_new(PhoneNumber)
      end

      it "re-renders the 'new' template" do
        post :create, {:phone_number => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      let(:bob) { Person.create(first_name: 'Bob', last_name: 'Jones') }
      let(:valid_attributes) { {number: '555-5678', person_id: bob.id} }
      let(:new_attributes) { {number: '4445556666', person_id: bob.id} }

      it "updates the requested phone_number" do
        phone_number = PhoneNumber.create! valid_attributes
        put :update, {:id => phone_number.to_param, :phone_number => new_attributes}, valid_session
        phone_number.reload
        expect(phone_number.number).to eq("4445556666")
      end

      it "assigns the requested phone_number as @phone_number" do
        phone_number = PhoneNumber.create! valid_attributes
        put :update, {:id => phone_number.to_param, :phone_number => valid_attributes}, valid_session
        expect(assigns(:phone_number)).to eq(phone_number)
      end

      it "redirects to the person" do
        bob = Person.create(first_name: 'Bob', last_name: 'Jones')
        valid_attributes = {number: '555-5678', person_id: bob.id}
        phone_number = PhoneNumber.create! valid_attributes
        put :update, {:id => phone_number.to_param, :phone_number => valid_attributes}, valid_session
        expect(response).to redirect_to(bob)
      end
    end

    context "with invalid params" do
      it "assigns the phone_number as @phone_number" do
        phone_number = PhoneNumber.create! valid_attributes
        put :update, {:id => phone_number.to_param, :phone_number => invalid_attributes}, valid_session
        expect(assigns(:phone_number)).to eq(phone_number)
      end

      it "re-renders the 'edit' template" do
        phone_number = PhoneNumber.create! valid_attributes
        put :update, {:id => phone_number.to_param, :phone_number => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do

    let(:bob) { Person.create(first_name: 'Bob', last_name: 'Jones') }
    let(:valid_attributes) { {number: '555-5678', person_id: bob.id} }

    it "destroys the requested phone_number" do
      phone_number = PhoneNumber.create! valid_attributes
      expect {
        delete :destroy, {:id => phone_number.to_param}, valid_session
      }.to change(PhoneNumber, :count).by(-1)
    end

    it "redirects to the person" do
      phone_number = PhoneNumber.create! valid_attributes
      delete :destroy, {:id => phone_number.to_param}, valid_session
      expect(response).to redirect_to(bob)
    end
  end

end