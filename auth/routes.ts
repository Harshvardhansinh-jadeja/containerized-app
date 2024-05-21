/**
 * an array of routes that are accessible to the private
 * these routes require authentication
 * @type {string[]}
 */
export const publicRoutes = ["/"];

// if you write this way it will show when you hover somewhere else authRoutes
/**
 * an array of routes that are accessible to the private
 * these routes require authentication
 * @type {string[]}
 */
export const authRoutes = ["/auth/login", "/auth/register"];
/**
 * prefix for API authentication routes
 * Routes that start with this prefix are used for API authentication purposes
 * @type {string[]}
 */
export const apiAuthPrefix = "/api/auth";

/**
 *default redirect path after loggin in
 * @type {string[]}
 */
export const DEFAULT_LOGIN_REDIRECT = "/settings";
