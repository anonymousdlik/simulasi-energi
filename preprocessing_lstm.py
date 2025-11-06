import pandas as pd
import numpy as np
from sklearn.preprocessing import MinMaxScaler
from scipy import stats

df = pd.read_csv('energy_data.csv')

# ubah timestamp
df['timestamp'] = pd.to_datetime(df['timestamp'])
df.set_index('timestamp', inplace=True)

# resampling 5 menit (sinkronisasi)
df = df.resample('5T').mean().interpolate()

# handle outlier (Z-score)
z_scores = np.abs(stats.zscore(df.select_dtypes(include=[np.number])))
df = df[(z_scores < 3).all(axis=1)]

# feature engineering
df['sin_hour'] = np.sin(2 * np.pi * df['hour'] / 24)
df['cos_hour'] = np.cos(2 * np.pi * df['hour'] / 24)
df['power_lag_1'] = df['power_kW'].shift(1)
df['power_lag_12'] = df['power_kW'].shift(12)
df['rolling_mean_12'] = df['power_kW'].rolling(window=12).mean()

df.dropna(inplace=True)

# normalisasi
scaler = MinMaxScaler()
scaled = scaler.fit_transform(df)
np.save('scaler.npy', scaler.data_max_)
np.savetxt('energy_scaled.csv', scaled, delimiter=',')
