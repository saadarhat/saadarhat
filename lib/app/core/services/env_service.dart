class EnvService {
  static const stripePublishableKey = String.fromEnvironment('STRIPE_PUBLISHABLE_KEY');
  static const apiBaseUrl = String.fromEnvironment('API_BASE_URL');
}
