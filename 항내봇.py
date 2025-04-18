import streamlit as st
import pandas as pd
from sklearn.preprocessing import OneHotEncoder
import joblib
from tensorflow.keras.models import load_model

# 모델 & 인코더 불러오기
model = load_model(r'C:\Users\user\Documents\trained_model_1.h5')
encoder = joblib.load(r'C:\Users\user\Documents\categorical_encoder.pkl')  # 원핫 인코더 저장된 경우

# 질문을 받아서 각 변수에 값을 할당하는 함수
def get_input():
    # 각 항목을 따로 입력 받기
    # 세션 상태로 값 저장 (예측 후에도 값을 유지)
    if 'ANTBT_NM' not in st.session_state:
        st.session_state.ANTBT_NM = "Amikacin"  # 기본값

    ANTBT_NM = st.text_input("항생제 이름을 입력하세요 (예: Amikacin)")
    st.session_state.ANTBT_NM = ANTBT_NM  # 입력된 값 세션 상태에 저장
    
    TPRSC_CAPA = st.number_input("1일 총 처방량을 입력하세요 (예: 100)", step=1)
    DAY = st.number_input("처방 일수을 입력하세요 (예: 6)", step=1)

    INGR_NM = "기본약물"  
    antibiotics = "기타"  
    
    return INGR_NM, ANTBT_NM, TPRSC_CAPA, DAY, antibiotics

# Streamlit 앱
st.title('항내봇(항생제 내성 확률 예측 챗봇)')

# 사용자 입력 받기
INGR_NM, ANTBT_NM, TPRSC_CAPA, DAY, antibiotics = get_input()

# 예측 버튼
if st.button("예측 시작"):
    if ANTBT_NM and TPRSC_CAPA and DAY:
        # 데이터프레임 생성
        input_df = pd.DataFrame([{
            'INGR_NM': INGR_NM,           # 기본값
            'ANTBT_NM': ANTBT_NM,         # 사용자 입력
            'antibiotics': antibiotics,   # 기본값
            'TPRSC_CAPA': TPRSC_CAPA,     # 사용자 입력
            'DAY': DAY                    # 사용자 입력
        }])

        
        # 원핫 인코딩 적용
        X_cat = encoder.transform(input_df[['INGR_NM', 'ANTBT_NM', 'antibiotics']])
        X_cat_df = pd.DataFrame(X_cat, columns=encoder.get_feature_names_out())

        # 수치형 피처
        X_num = input_df[['TPRSC_CAPA', 'DAY']]

        # 최종 입력
        X_input = pd.concat([X_cat_df, X_num], axis=1)

        # 예측
        prob = model.predict(X_input)[0][0]

        # 예측 결과 출력
        st.write(f"예상 내성 확률: {prob:.2%}")
    else:
        st.write("모든 입력을 완료해주세요.")